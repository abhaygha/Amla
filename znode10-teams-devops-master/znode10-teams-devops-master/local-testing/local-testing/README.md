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
