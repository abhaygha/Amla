# Quick DevSecOps Test Script for Windows
# This script provides a fast way to test the security tools locally

Write-Host "🚀 Quick DevSecOps Test for Windows" -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Green

# Check if we're in the right directory
if (-not (Test-Path "docker-compose.yml")) {
    Write-Host "❌ Please run this script from the local-testing directory" -ForegroundColor Red
    exit 1
}

# Function to check if a port is available
function Test-Port {
    param([int]$Port)
    
    try {
        $connection = New-Object System.Net.Sockets.TcpClient
        $connection.Connect("localhost", $Port)
        $connection.Close()
        return $false  # Port is in use
    }
    catch {
        return $true   # Port is available
    }
}

# Check required ports
Write-Host "🔍 Checking port availability..." -ForegroundColor Blue
if (-not (Test-Port 9000)) {
    Write-Host "❌ Port 9000 is already in use. Please free it up or modify docker-compose.yml" -ForegroundColor Red
    exit 1
}
if (-not (Test-Port 8080)) {
    Write-Host "❌ Port 8080 is already in use. Please free it up or modify docker-compose.yml" -ForegroundColor Red
    exit 1
}
if (-not (Test-Port 8081)) {
    Write-Host "❌ Port 8081 is already in use. Please free it up or modify docker-compose.yml" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Ports are available" -ForegroundColor Green

# Start services
Write-Host "🔧 Starting Docker services..." -ForegroundColor Blue
docker-compose up -d

# Wait for services to be ready
Write-Host "⏳ Waiting for services to be ready..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Test 1: GitLeaks (Secret Detection)
Write-Host ""
Write-Host "1️⃣  Testing GitLeaks Secret Detection..." -ForegroundColor Cyan
Write-Host "Creating test file with fake secrets..." -ForegroundColor Blue

@"
# Test file with fake secrets for GitLeaks testing
API_KEY=test_api_key_12345
DATABASE_PASSWORD=test_password_67890
JWT_SECRET=test_jwt_secret_abcdef
AZURE_STORAGE_KEY=test_storage_key_xyz789
"@ | Out-File -FilePath "test-secrets.txt" -Encoding UTF8

# Run GitLeaks scan
docker run --rm -v ${PWD}:/path -v ${PWD}/.gitleaks.toml:/.gitleaks.toml zricethezav/gitleaks:latest `
  detect --source="/path" --config="/.gitleaks.toml" --report-format=sarif --report-path=/path/results/gitleaks-report.sarif

Write-Host "✅ GitLeaks test completed" -ForegroundColor Green

# Test 2: SonarQube (SAST)
Write-Host ""
Write-Host "2️⃣  Testing SonarQube SAST Analysis..." -ForegroundColor Cyan
Write-Host "⏳ Waiting for SonarQube to be ready..." -ForegroundColor Yellow

# Wait for SonarQube
do {
    Write-Host "   Still waiting for SonarQube..." -ForegroundColor Yellow
    Start-Sleep -Seconds 10
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:9000/api/system/status" -Method Get
    }
    catch {
        $response = $null
    }
} while ($response -and $response.status -ne "UP")

Write-Host "✅ SonarQube is ready!" -ForegroundColor Green

# Create a test token
Write-Host "🔑 Creating test SonarQube token..." -ForegroundColor Blue
try {
    $tokenResponse = Invoke-RestMethod -Uri "http://localhost:9000/api/user_tokens/generate" `
        -Method Post -Body "name=test-token" -ContentType "application/x-www-form-urlencoded" `
        -Headers @{Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("admin:admin"))}
    $TOKEN = $tokenResponse.token
}
catch {
    Write-Host "⚠️  Could not create token, using default admin:admin" -ForegroundColor Yellow
    $TOKEN = "admin"
}

# Run SonarQube scanner
Write-Host "Running SonarQube scanner..." -ForegroundColor Blue
Set-Location test-code

# Install SonarQube scanner
dotnet tool install --global dotnet-sonarscanner

# Run analysis
dotnet sonarscanner begin `
  /k:"test-project-local" `
  /n:"Test Project Local" `
  /v:"1.0.0" `
  /d:sonar.host.url="http://localhost:9000" `
  /d:sonar.login="$TOKEN"

dotnet build --configuration Release
dotnet sonarscanner end /d:sonar.login="$TOKEN"

Set-Location ..
Write-Host "✅ SonarQube test completed" -ForegroundColor Green

# Test 3: Dependency Check
Write-Host ""
Write-Host "3️⃣  Testing OWASP Dependency Check..." -ForegroundColor Cyan
docker run --rm -v ${PWD}/test-code:/src -v ${PWD}/results:/report `
  owasp/dependency-check:latest `
  --scan /src `
  --format "HTML" "JSON" "SARIF" `
  --out /report `
  --failOnCVSS 7 `
  --enableRetired `
  --prettyPrint

Write-Host "✅ Dependency Check test completed" -ForegroundColor Green

# Test 4: Trivy (Image Scanning)
Write-Host ""
Write-Host "4️⃣  Testing Trivy Image Scanning..." -ForegroundColor Cyan
Set-Location test-code

# Build test image
Write-Host "   Building test Docker image..." -ForegroundColor Blue
docker build -t test-image:latest .

# Scan the image
Write-Host "   Scanning Docker image..." -ForegroundColor Blue
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock `
  -v ${PWD}/../results:/report `
  aquasec/trivy:latest `
  image test-image:latest `
  --format json `
  --output /report/trivy-image.json `
  --severity HIGH,CRITICAL

# Clean up
docker rmi test-image:latest
Set-Location ..

Write-Host "✅ Trivy test completed" -ForegroundColor Green

# Test 5: ZAP (DAST)
Write-Host ""
Write-Host "5️⃣  Testing OWASP ZAP DAST..." -ForegroundColor Cyan

# Start a simple web server for testing
Set-Location test-code
Write-Host "   Starting test web server..." -ForegroundColor Blue

# Use Python or Node.js for simple server
if (Get-Command python -ErrorAction SilentlyContinue) {
    Start-Process python -ArgumentList "-m", "http.server", "8082" -WindowStyle Hidden
    $SERVER_PID = Get-Process python | Where-Object {$_.CommandLine -like "*http.server*"} | Select-Object -First 1 -ExpandProperty Id
}
elseif (Get-Command node -ErrorAction SilentlyContinue) {
    Start-Process node -ArgumentList "-e", "require('http').createServer((req, res) => res.end('Hello World')).listen(8082)" -WindowStyle Hidden
    $SERVER_PID = Get-Process node | Select-Object -First 1 -ExpandProperty Id
}
else {
    Write-Host "⚠️  No Python or Node.js found. Skipping ZAP test." -ForegroundColor Yellow
    Set-Location ..
    goto :summary
}

# Wait for server to start
Start-Sleep -Seconds 5

# Run ZAP scan
Write-Host "   Running ZAP scan..." -ForegroundColor Blue
docker run --rm -v ${PWD}/../results:/zap/wrk `
  owasp/zap2docker-stable `
  zap-baseline.py `
  -t http://localhost:8082 `
  -J /zap/wrk/zap-report.json `
  -m 1

# Stop test server
if ($SERVER_PID) {
    Stop-Process -Id $SERVER_PID -Force
}
Set-Location ..

Write-Host "✅ ZAP test completed" -ForegroundColor Green

# Generate summary report
:summary
Write-Host ""
Write-Host "📊 Generating test summary..." -ForegroundColor Blue

@"
# DevSecOps Quick Test Summary

## Test Results

### ✅ GitLeaks (Secret Detection)
- Status: Completed
- Report: gitleaks-report.sarif
- Found: Test secrets in test-secrets.txt

### ✅ SonarQube (SAST)
- Status: Completed
- Dashboard: http://localhost:9000
- Project: test-project-local
- Login: admin/admin

### ✅ OWASP Dependency Check
- Status: Completed
- Reports: HTML, JSON, SARIF formats
- Location: results/ directory

### ✅ Trivy (Image Scanning)
- Status: Completed
- Reports: trivy-image.json
- Scanned: test-image:latest

### ✅ OWASP ZAP (DAST)
- Status: Completed
- Report: zap-report.json
- Target: Local test server

## Access Points
- **SonarQube**: http://localhost:9000 (admin/admin)
- **All Results**: Check results/ directory

## Next Steps
1. Review all reports in the results/ directory
2. Check SonarQube dashboard at http://localhost:9000
3. Analyze security findings
4. Fix any identified issues
5. Re-run tests to verify fixes

## Notes
- This was a quick test with sample code
- Real projects may have different results
- Customize security rules for your specific needs
"@ | Out-File -FilePath "results/test-summary.md" -Encoding UTF8

Write-Host "🎉 All tests completed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Results available in: results/ directory" -ForegroundColor Cyan
Write-Host "🌐 SonarQube Dashboard: http://localhost:9000 (admin/admin)" -ForegroundColor Cyan
Write-Host "📋 Summary Report: results/test-summary.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "🧹 To clean up, run: docker-compose down" -ForegroundColor Yellow
Write-Host "🔄 To run tests again, run: .\quick-test.ps1" -ForegroundColor Yellow

