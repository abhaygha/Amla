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
