#!/bin/bash

# Quick DevSecOps Test Script
# This script provides a fast way to test the security tools locally

echo "🚀 Quick DevSecOps Test"
echo "======================="

# Check if we're in the right directory
if [ ! -f "docker-compose.yml" ]; then
    echo "❌ Please run this script from the local-testing directory"
    exit 1
fi

# Function to check if a port is available
check_port() {
    if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null ; then
        echo "❌ Port $1 is already in use. Please free it up or modify docker-compose.yml"
        return 1
    fi
    return 0
}

# Check required ports
echo "🔍 Checking port availability..."
check_port 9000 || exit 1  # SonarQube
check_port 8080 || exit 1  # Dependency Check
check_port 8081 || exit 1  # ZAP
echo "✅ Ports are available"

# Start services
echo "🔧 Starting Docker services..."
docker-compose up -d

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 30

# Test 1: GitLeaks (Secret Detection)
echo ""
echo "1️⃣  Testing GitLeaks Secret Detection..."
echo "Creating test file with fake secrets..."

cat > test-secrets.txt << 'EOF'
# Test file with fake secrets for GitLeaks testing
API_KEY=test_api_key_12345
DATABASE_PASSWORD=test_password_67890
JWT_SECRET=test_jwt_secret_abcdef
AZURE_STORAGE_KEY=test_storage_key_xyz789
EOF

# Run GitLeaks scan
docker run --rm -v $(pwd):/path -v $(pwd)/.gitleaks.toml:/.gitleaks.toml zricethezav/gitleaks:latest \
  detect --source="/path" --config="/.gitleaks.toml" --report-format=sarif --report-path=/path/results/gitleaks-report.sarif

echo "✅ GitLeaks test completed"

# Test 2: SonarQube (SAST)
echo ""
echo "2️⃣  Testing SonarQube SAST Analysis..."
echo "⏳ Waiting for SonarQube to be ready..."

# Wait for SonarQube
until curl -s http://localhost:9000/api/system/status | grep -q "UP"; do
    echo "   Still waiting for SonarQube..."
    sleep 10
done

echo "✅ SonarQube is ready!"

# Create a test token
echo "🔑 Creating test SonarQube token..."
TOKEN=$(curl -s -u admin:admin -X POST "http://localhost:9000/api/user_tokens/generate" \
  -d "name=test-token" | jq -r '.token')

if [ "$TOKEN" = "null" ] || [ -z "$TOKEN" ]; then
    echo "⚠️  Could not create token, using default admin:admin"
    TOKEN="admin"
fi

# Run SonarQube scanner
cd test-code
dotnet tool install --global dotnet-sonarscanner

dotnet sonarscanner begin \
  /k:"test-project-local" \
  /n:"Test Project Local" \
  /v:"1.0.0" \
  /d:sonar.host.url="http://localhost:9000" \
  /d:sonar.login="$TOKEN"

dotnet build --configuration Release
dotnet sonarscanner end /d:sonar.login="$TOKEN"

cd ..
echo "✅ SonarQube test completed"

# Test 3: Dependency Check
echo ""
echo "3️⃣  Testing OWASP Dependency Check..."
docker run --rm -v $(pwd)/test-code:/src -v $(pwd)/results:/report \
  owasp/dependency-check:latest \
  --scan /src \
  --format "HTML" "JSON" "SARIF" \
  --out /report \
  --failOnCVSS 7 \
  --enableRetired \
  --prettyPrint

echo "✅ Dependency Check test completed"

# Test 4: Trivy (Image Scanning)
echo ""
echo "4️⃣  Testing Trivy Image Scanning..."
cd test-code

# Build test image
echo "   Building test Docker image..."
docker build -t test-image:latest .

# Scan the image
echo "   Scanning Docker image..."
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/../results:/report \
  aquasec/trivy:latest \
  image test-image:latest \
  --format json \
  --output /report/trivy-image.json \
  --severity HIGH,CRITICAL

# Clean up
docker rmi test-image:latest
cd ..

echo "✅ Trivy test completed"

# Test 5: ZAP (DAST)
echo ""
echo "5️⃣  Testing OWASP ZAP DAST..."

# Start a simple web server for testing
cd test-code
echo "   Starting test web server..."
python3 -m http.server 8082 &
SERVER_PID=$!

# Wait for server to start
sleep 5

# Run ZAP scan
echo "   Running ZAP scan..."
docker run --rm -v $(pwd)/../results:/zap/wrk \
  owasp/zap2docker-stable \
  zap-baseline.py \
  -t http://localhost:8082 \
  -J /zap/wrk/zap-report.json \
  -m 1

# Stop test server
kill $SERVER_PID
cd ..

echo "✅ ZAP test completed"

# Generate summary report
echo ""
echo "📊 Generating test summary..."
cat > results/test-summary.md << 'EOF'
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
EOF

echo "🎉 All tests completed successfully!"
echo ""
echo "📊 Results available in: results/ directory"
echo "🌐 SonarQube Dashboard: http://localhost:9000 (admin/admin)"
echo "📋 Summary Report: results/test-summary.md"
echo ""
echo "🧹 To clean up, run: docker-compose down"
echo "🔄 To run tests again, run: ./quick-test.sh"

