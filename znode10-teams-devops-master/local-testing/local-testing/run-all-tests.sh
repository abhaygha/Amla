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
