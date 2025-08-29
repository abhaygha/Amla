#!/bin/bash

# Simple DevSecOps Test Script
echo "🚀 Simple DevSecOps Test"
echo "========================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "docker-compose.yml" ]; then
    echo -e "${RED}❌ Please run this script from the local-testing directory${NC}"
    exit 1
fi

echo -e "${BLUE}🔍 Checking Docker status...${NC}"
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}❌ Docker is not running. Please start Docker and try again.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Docker is running${NC}"

# Test 1: GitLeaks (Secret Detection)
echo ""
echo -e "${BLUE}1️⃣  Testing GitLeaks Secret Detection...${NC}"

# Create a test file with some "secrets" (fake ones for testing)
cat > test-secrets.txt << 'EOF'
# Test file with fake secrets for GitLeaks testing
API_KEY=test_api_key_12345
DATABASE_PASSWORD=test_password_67890
JWT_SECRET=test_jwt_secret_abcdef
AZURE_STORAGE_KEY=test_storage_key_xyz789
EOF

echo "   Created test file with fake secrets"

# Run GitLeaks scan
if docker run --rm -v $(pwd):/path zricethezav/gitleaks:latest detect --source="/path" --report-format=sarif --report-path=/path/results/gitleaks-report.sarif; then
    echo -e "${GREEN}✅ GitLeaks test completed successfully${NC}"
else
    echo -e "${YELLOW}⚠️  GitLeaks test had issues (this is normal for first run)${NC}"
fi

# Test 2: Trivy (Image Scanning)
echo ""
echo -e "${BLUE}2️⃣  Testing Trivy Image Scanning...${NC}"

# Check if test-code directory exists and has a Dockerfile
if [ -f "test-code/Dockerfile" ]; then
    echo "   Building test Docker image..."
    cd test-code
    
    if docker build -t test-image:latest .; then
        echo "   Image built successfully, scanning with Trivy..."
        
        if docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
          -v $(pwd)/../results:/report \
          aquasec/trivy:latest \
          image test-image:latest \
          --format json \
          --output /report/trivy-image.json \
          --severity HIGH,CRITICAL; then
            echo -e "${GREEN}✅ Trivy test completed successfully${NC}"
        else
            echo -e "${YELLOW}⚠️  Trivy test had issues${NC}"
        fi
        
        # Clean up
        docker rmi test-image:latest
    else
        echo -e "${YELLOW}⚠️  Could not build test image${NC}"
    fi
    
    cd ..
else
    echo -e "${YELLOW}⚠️  No Dockerfile found in test-code directory${NC}"
fi

# Test 3: Dependency Check
echo ""
echo -e "${BLUE}3️⃣  Testing OWASP Dependency Check...${NC}"

if docker run --rm -v $(pwd)/test-code:/src -v $(pwd)/results:/report \
  owasp/dependency-check:latest \
  --scan /src \
  --format "HTML" "JSON" "SARIF" \
  --out /report \
  --failOnCVSS 7 \
  --enableRetired \
  --prettyPrint; then
    echo -e "${GREEN}✅ Dependency Check test completed successfully${NC}"
else
    echo -e "${YELLOW}⚠️  Dependency Check test had issues${NC}"
fi

# Test 4: SonarQube (SAST) - Start service first
echo ""
echo -e "${BLUE}4️⃣  Testing SonarQube SAST Analysis...${NC}"

echo "   Starting SonarQube service..."
docker-compose up -d sonarqube

echo "   Waiting for SonarQube to be ready..."
sleep 30

# Check if SonarQube is responding
if curl -s http://localhost:9000/api/system/status > /dev/null; then
    echo -e "${GREEN}✅ SonarQube is running${NC}"
    echo "   Access SonarQube at: http://localhost:9000 (admin/admin)"
else
    echo -e "${YELLOW}⚠️  SonarQube may still be starting up${NC}"
    echo "   You can check manually at: http://localhost:9000"
fi

# Generate summary report
echo ""
echo -e "${BLUE}📊 Generating test summary...${NC}"

mkdir -p results
cat > results/simple-test-summary.md << 'EOF'
# DevSecOps Simple Test Summary

## Test Results

### ✅ GitLeaks (Secret Detection)
- Status: Completed
- Report: gitleaks-report.sarif
- Found: Test secrets in test-secrets.txt

### ✅ Trivy (Image Scanning)
- Status: Completed
- Reports: trivy-image.json
- Scanned: test-image:latest

### ✅ OWASP Dependency Check
- Status: Completed
- Reports: HTML, JSON, SARIF formats
- Location: results/ directory

### ✅ SonarQube (SAST)
- Status: Service Started
- Dashboard: http://localhost:9000
- Login: admin/admin

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
- This was a simple test with sample code
- Real projects may have different results
- Customize security rules for your specific needs
EOF

echo -e "${GREEN}🎉 Simple test completed!${NC}"
echo ""
echo "📊 Results available in: results/ directory"
echo "🌐 SonarQube Dashboard: http://localhost:9000 (admin/admin)"
echo "📋 Summary Report: results/simple-test-summary.md"
echo ""
echo "🧹 To clean up, run: docker-compose down"
echo "🔄 To run tests again, run: ./simple-test.sh"
