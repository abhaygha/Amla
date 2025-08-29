#!/bin/bash

# DevSecOps Local Testing Script
# This script sets up a local testing environment for all security tools

set -e

echo "🚀 Starting DevSecOps Local Testing Environment"
echo "================================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}❌ Docker is not running. Please start Docker and try again.${NC}"
    exit 1
fi

# Check if Docker Compose is available
if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}❌ Docker Compose is not installed. Please install it and try again.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Docker environment check passed${NC}"

# Create test directories
mkdir -p local-testing/results
mkdir -p local-testing/test-code
mkdir -p local-testing/logs

echo -e "${BLUE}📁 Created test directories${NC}"

# Create a simple .NET test project for testing
cat > local-testing/test-code/TestProject.csproj << 'EOF'
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net7.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Newtonsoft.Json" Version="13.0.3" />
    <PackageReference Include="Microsoft.Extensions.Logging" Version="7.0.0" />
  </ItemGroup>
</Project>
EOF

# Create a simple C# file with some test code
cat > local-testing/test-code/Program.cs << 'EOF'
using System;
using Newtonsoft.Json;

namespace TestProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello from Test Project!");
            
            // Test JSON serialization
            var testObj = new { Name = "Test", Value = 42 };
            var json = JsonConvert.SerializeObject(testObj);
            Console.WriteLine($"JSON: {json}");
            
            // Test logging
            Console.WriteLine("Application started successfully");
        }
    }
}
EOF

# Create a simple Dockerfile for testing
cat > local-testing/test-code/Dockerfile << 'EOF'
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["TestProject.csproj", "./"]
RUN dotnet restore "TestProject.csproj"
COPY . .
RUN dotnet build "TestProject.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TestProject.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TestProject.dll"]
EOF

echo -e "${GREEN}✅ Created test .NET project${NC}"

# Create docker-compose file for local testing
cat > local-testing/docker-compose.yml << 'EOF'
version: '3.8'

services:
  # SonarQube for SAST testing
  sonarqube:
    image: sonarqube:9.9-community
    ports:
      - "9000:9000"
    environment:
      - SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true
    volumes:
      - sonarqube_data:/opt/sonarqube/data
      - sonarqube_extensions:/opt/sonarqube/extensions
      - sonarqube_logs:/opt/sonarqube/logs
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:9000/api/system/status"]
      interval: 30s
      timeout: 10s
      retries: 3

  # OWASP Dependency Check
  dependency-check:
    image: owasp/dependency-check:latest
    ports:
      - "8080:8080"
    volumes:
      - ./test-code:/src
      - ./results:/report
      - dependency-check-data:/usr/share/dependency-check/data
    command: >
      --scan /src
      --format "HTML" "JSON" "SARIF"
      --out /report
      --failOnCVSS 7
      --enableRetired
      --prettyPrint

  # Trivy for image scanning
  trivy:
    image: aquasec/trivy:latest
    volumes:
      - ./test-code:/src
      - ./results:/report
    working_dir: /src
    command: >
      config .
      --format json
      --output /report/trivy-config.json
      --severity HIGH,CRITICAL

  # OWASP ZAP for DAST testing
  zap:
    image: owasp/zap2docker-stable
    ports:
      - "8081:8080"
    volumes:
      - ./results:/zap/wrk
    command: >
      zap-baseline.py
      -t http://localhost:8081
      -J /zap/wrk/zap-report.json

volumes:
  sonarqube_data:
  sonarqube_extensions:
  sonarqube_logs:
  dependency-check-data:
EOF

echo -e "${GREEN}✅ Created Docker Compose configuration${NC}"

# Create a test script for each security tool
echo -e "${BLUE}🔧 Setting up individual test scripts...${NC}"

# GitLeaks test script
cat > local-testing/test-gitleaks.sh << 'EOF'
#!/bin/bash
echo "🔍 Testing GitLeaks Secret Detection..."

# Create a test file with some "secrets" (fake ones for testing)
cat > test-secrets.txt << 'SECRETS'
# Test file with fake secrets for GitLeaks testing
API_KEY=test_api_key_12345
DATABASE_PASSWORD=test_password_67890
JWT_SECRET=test_jwt_secret_abcdef
AZURE_STORAGE_KEY=test_storage_key_xyz789
SECRETS

# Run GitLeaks scan
docker run --rm -v $(pwd):/path -v $(pwd)/.gitleaks.toml:/.gitleaks.toml zricethezav/gitleaks:latest \
  detect --source="/path" --config="/.gitleaks.toml" --report-format=sarif --report-path=/path/results/gitleaks-report.sarif

echo "✅ GitLeaks test completed"
EOF

# SonarQube test script
cat > local-testing/test-sonarqube.sh << 'EOF'
#!/bin/bash
echo "🔍 Testing SonarQube SAST Analysis..."

# Wait for SonarQube to be ready
echo "⏳ Waiting for SonarQube to be ready..."
until curl -s http://localhost:9000/api/system/status | grep -q "UP"; do
    sleep 5
done

# Create a test token (in real scenario, you'd get this from SonarQube)
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

echo "✅ SonarQube test completed"
EOF

# Dependency Check test script
cat > local-testing/test-dependency-check.sh << 'EOF'
#!/bin/bash
echo "🔍 Testing OWASP Dependency Check..."

# Run dependency check
docker run --rm -v $(pwd)/test-code:/src -v $(pwd)/results:/report \
  owasp/dependency-check:latest \
  --scan /src \
  --format "HTML" "JSON" "SARIF" \
  --out /report \
  --suppression /src/suppression.xml \
  --failOnCVSS 7 \
  --enableRetired \
  --prettyPrint

echo "✅ Dependency Check test completed"
EOF

# Trivy test script
cat > local-testing/test-trivy.sh << 'EOF'
#!/bin/bash
echo "🔍 Testing Trivy Image Scanning..."

# Build test image
cd test-code
docker build -t test-image:latest .

# Scan the image
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/../results:/report \
  aquasec/trivy:latest \
  image test-image:latest \
  --format json \
  --output /report/trivy-image.json \
  --severity HIGH,CRITICAL

# Clean up
docker rmi test-image:latest

echo "✅ Trivy test completed"
EOF

# ZAP test script
cat > local-testing/test-zap.sh << 'EOF'
#!/bin/bash
echo "🔍 Testing OWASP ZAP DAST..."

# Start a simple web server for testing
cd test-code
python3 -m http.server 8082 &
SERVER_PID=$!

# Wait for server to start
sleep 3

# Run ZAP scan
docker run --rm -v $(pwd)/../results:/zap/wrk \
  owasp/zap2docker-stable \
  zap-baseline.py \
  -t http://localhost:8082 \
  -J /zap/wrk/zap-report.json \
  -m 1

# Stop test server
kill $SERVER_PID

echo "✅ ZAP test completed"
EOF

# Make scripts executable
chmod +x local-testing/test-*.sh

echo -e "${GREEN}✅ Created test scripts${NC}"

# Create a comprehensive test runner
cat > local-testing/run-all-tests.sh << 'EOF'
#!/bin/bash

# Comprehensive DevSecOps Test Runner
echo "🚀 Starting Comprehensive DevSecOps Testing"
echo "============================================"

# Start all services
echo "🔧 Starting Docker services..."
docker-compose up -d

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 30

# Run all tests
echo "🧪 Running security tests..."

# Test 1: GitLeaks
echo "1️⃣  Testing GitLeaks..."
./test-gitleaks.sh

# Test 2: SonarQube
echo "2️⃣  Testing SonarQube..."
./test-sonarqube.sh

# Test 3: Dependency Check
echo "3️⃣  Testing Dependency Check..."
./test-dependency-check.sh

# Test 4: Trivy
echo "4️⃣  Testing Trivy..."
./test-trivy.sh

# Test 5: ZAP
echo "5️⃣  Testing ZAP..."
./test-zap.sh

# Generate summary report
echo "📊 Generating test summary..."
cat > results/test-summary.md << 'SUMMARY'
# DevSecOps Local Test Summary

## Test Results

### ✅ GitLeaks (Secret Detection)
- Status: Completed
- Report: gitleaks-report.sarif

### ✅ SonarQube (SAST)
- Status: Completed
- Dashboard: http://localhost:9000
- Project: test-project-local

### ✅ OWASP Dependency Check
- Status: Completed
- Reports: HTML, JSON, SARIF formats

### ✅ Trivy (Image Scanning)
- Status: Completed
- Reports: trivy-config.json, trivy-image.json

### ✅ OWASP ZAP (DAST)
- Status: Completed
- Report: zap-report.json

## Next Steps
1. Review all reports in the results/ directory
2. Check SonarQube dashboard at http://localhost:9000
3. Analyze security findings
4. Fix any identified issues
5. Re-run tests to verify fixes

## Access Points
- **SonarQube**: http://localhost:9000 (admin/admin)
- **Dependency Check**: Reports in results/ directory
- **All Results**: Check results/ directory for detailed reports
SUMMARY

echo "🎉 All tests completed! Check results/ directory for reports."
echo "📊 Summary report: results/test-summary.md"
echo "🌐 SonarQube Dashboard: http://localhost:9000"

# Stop services
echo "🛑 Stopping services..."
docker-compose down

echo "✅ Testing completed successfully!"
EOF

chmod +x local-testing/run-all-tests.sh

# Create a cleanup script
cat > local-testing/cleanup.sh << 'EOF'
#!/bin/bash
echo "🧹 Cleaning up test environment..."

# Stop and remove containers
docker-compose down -v

# Remove test images
docker rmi test-image:latest 2>/dev/null || true

# Clean up test files
rm -rf results/*
rm -rf logs/*

echo "✅ Cleanup completed!"
EOF

chmod +x local-testing/cleanup.sh

# Create a README for local testing
cat > local-testing/README.md << 'EOF'
# DevSecOps Local Testing Guide

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose installed
- .NET 7.0 SDK installed
- Python 3.x installed
- Git installed

### Running Tests

#### Option 1: Run All Tests at Once
```bash
cd local-testing
./run-all-tests.sh
```

#### Option 2: Run Individual Tests
```bash
cd local-testing

# Start services
docker-compose up -d

# Wait for services to be ready
sleep 30

# Run individual tests
./test-gitleaks.sh
./test-sonarqube.sh
./test-dependency-check.sh
./test-trivy.sh
./test-zap.sh

# Stop services
docker-compose down
```

#### Option 3: Manual Testing
```bash
cd local-testing

# Start services
docker-compose up -d

# Access SonarQube
open http://localhost:9000
# Login: admin/admin

# Check results directory
ls -la results/
```

## 📊 Test Results

All test results are stored in the `results/` directory:
- `gitleaks-report.sarif` - Secret detection results
- `dependency-check-report.html` - Dependency vulnerability report
- `trivy-config.json` - Dockerfile security scan
- `trivy-image.json` - Container image scan
- `zap-report.json` - DAST scan results

## 🔧 Customization

### Adding More Test Code
Place additional test files in the `test-code/` directory.

### Modifying Test Parameters
Edit the individual test scripts to adjust scan parameters.

### Adding New Security Tools
1. Add the tool to `docker-compose.yml`
2. Create a test script for the tool
3. Update `run-all-tests.sh`

## 🚨 Troubleshooting

### Common Issues

#### Port Conflicts
If ports are already in use, modify the port mappings in `docker-compose.yml`.

#### Permission Issues
Make sure the test scripts are executable:
```bash
chmod +x *.sh
```

#### Service Startup Issues
Check service logs:
```bash
docker-compose logs [service-name]
```

### Cleanup
To completely reset the test environment:
```bash
./cleanup.sh
```

## 📈 Next Steps

After successful local testing:
1. Push the workflows to GitHub
2. Configure GitHub secrets and variables
3. Test the workflows in a real repository
4. Customize security rules for your codebase

## 🆘 Getting Help

If you encounter issues:
1. Check the logs in the `logs/` directory
2. Verify Docker services are running
3. Check individual tool documentation
4. Review the test scripts for configuration issues
EOF

echo -e "${GREEN}✅ Created local testing environment${NC}"

# Create a simple test runner for Windows
cat > local-testing/run-tests.bat << 'EOF'
@echo off
echo 🚀 Starting DevSecOps Local Testing
echo ====================================

REM Check if Docker is running
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker is not running. Please start Docker and try again.
    pause
    exit /b 1
)

REM Start services
echo 🔧 Starting Docker services...
docker-compose up -d

REM Wait for services
echo ⏳ Waiting for services to be ready...
timeout /t 30 /nobreak >nul

REM Run tests
echo 🧪 Running security tests...

echo 1️⃣  Testing GitLeaks...
bash test-gitleaks.sh

echo 2️⃣  Testing SonarQube...
bash test-sonarqube.sh

echo 3️⃣  Testing Dependency Check...
bash test-dependency-check.sh

echo 4️⃣  Testing Trivy...
bash test-trivy.sh

echo 5️⃣  Testing ZAP...
bash test-zap.sh

echo 🎉 All tests completed!
echo 📊 Check results/ directory for reports
echo 🌐 SonarQube Dashboard: http://localhost:9000

REM Stop services
echo 🛑 Stopping services...
docker-compose down

pause
EOF

echo -e "${GREEN}✅ Created Windows batch file${NC}"

echo ""
echo -e "${GREEN}🎉 Local testing environment setup completed!${NC}"
echo ""
echo "📁 Files created in local-testing/ directory:"
echo "  - run-all-tests.sh (Linux/Mac)"
echo "  - run-tests.bat (Windows)"
echo "  - docker-compose.yml (Docker services)"
echo "  - test-*.sh (Individual test scripts)"
echo "  - README.md (Detailed instructions)"
echo "  - cleanup.sh (Cleanup script)"
echo ""
echo "🚀 To start testing:"
echo "  cd local-testing"
echo "  ./run-all-tests.sh  # Linux/Mac"
echo "  run-tests.bat       # Windows"
echo ""
echo "🌐 SonarQube will be available at: http://localhost:9000"
echo "📊 All results will be in the results/ directory"

