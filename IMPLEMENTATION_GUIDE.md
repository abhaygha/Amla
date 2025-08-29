# DevSecOps Implementation Guide - Step by Step

## 🚀 Quick Start

This guide will help you set up the DevSecOps pipeline with SAST, Secret Management, and Image Scanning.

## 📋 Prerequisites Checklist

- [ ] Windows self-hosted runner configured and running
- [ ] .NET 8.0 SDK installed on runner
- [ ] Docker Desktop installed on runner
- [ ] kubectl configured on runner
- [ ] GitHub repository access

## 🔧 Step 1: Configure GitHub Secrets

Go to your repository Settings → Secrets and variables → Actions and add:

### Required Secrets
```
ACCESS_REPO          - GitHub Personal Access Token
SONAR_TOKEN          - SonarQube authentication token
TRIVY_USERNAME       - Trivy registry username
TRIVY_PASSWORD       - Trivy registry password
KUBECONFIG           - Kubernetes configuration
DEV_ACRUN            - Development ACR username
DEV_ACRPW            - Development ACR password
QA_ACRUN             - QA ACR username
QA_ACRPW             - QA ACR password
```

### Required Variables
```
DEV_ACR_SERVER       - Development ACR server URL
QA_ACR_SERVER        - QA ACR server URL
IMAGE_REGISTRY       - Container registry URL
ALERTS               - Google Chat webhook URL (optional)
```

## 🏗️ Step 2: Verify File Structure

Ensure these files are in your repository:

```
.github/
├── workflows/
│   ├── devsecops-core.yaml           ✅ Core security scanning
│   ├── build-deploy-secure.yaml      ✅ Main orchestration
│   ├── build-service.yaml            ✅ Service building
│   ├── deploy-service.yaml           ✅ Service deployment
│   └── dev1_build_deploy_secure.yml ✅ Dev1 trigger
├── services-config.json              ✅ Services configuration
└── README.md                         ✅ Documentation
```

## 🧪 Step 3: Test the Pipeline

1. **Go to Actions tab** in your GitHub repository
2. **Select "Trigger - Z10 DEV1 with DevSecOps"**
3. **Click "Run workflow"**
4. **Fill in parameters:**
   - Tenant: `z10`
   - Environment: `dev1`
   - Branch: `int`
   - Namespace: `znode`
   - Services: `{"wbst": true}` (test with webstore first)
   - Skip security scan: `false`
   - Security gate enabled: `true`

## 🔍 Step 4: Monitor Execution

Watch the workflow execution:

1. **Parse Services**: Generates service matrix
2. **Security Scanning**: Runs SAST, GitLeaks, Trivy
3. **Security Gate**: Checks if security passed
4. **Build Services**: Builds Docker images (if security passed)
5. **Deploy Services**: Deploys to Kubernetes (if security passed)
6. **Security Summary**: Generates final report

## 🚨 Step 5: Handle Security Issues

### If SAST Fails
- Review SonarQube findings
- Fix code quality issues
- Address security vulnerabilities
- Re-run pipeline

### If Secrets Detected
- Review GitLeaks report
- Remove hardcoded credentials
- Use environment variables
- Re-run pipeline

### If Vulnerabilities Found
- Review Trivy report
- Update base images
- Fix Dockerfile issues
- Re-run pipeline

## 🎯 Step 6: Customize for Your Environment

### Update Services Configuration
Edit `.github/services-config.json`:

```json
{
  "service": "your-service",
  "repository": "your-org/your-repo",
  "working_directory": "./src",
  "compose_file": "docker-compose.yml"
}
```

### Modify Security Rules
- **SonarQube**: Configure quality gates in SonarQube server
- **GitLeaks**: Customize detection patterns
- **Trivy**: Adjust vulnerability thresholds

## 🔧 Step 7: Advanced Configuration

### Environment-Specific Settings
- Different ACR servers per environment
- Environment-specific namespaces
- Custom security policies

### Security Gate Configuration
- Enable/disable per environment
- Custom failure thresholds
- Notification channels

## 📊 Step 8: Monitor and Maintain

### Regular Tasks
- Review security reports weekly
- Update security tool versions monthly
- Monitor pipeline performance
- Review and update security policies

### Metrics to Track
- Security scan success rate
- Vulnerability detection rate
- Pipeline execution time
- Security gate failure rate

## 🆘 Troubleshooting

### Common Issues

1. **Runner Not Available**
   ```
   Error: No runner available
   Solution: Check runner status, restart Windows service
   ```

2. **Security Tool Download Failed**
   ```
   Error: Failed to download GitLeaks/Trivy
   Solution: Check network connectivity, verify URLs
   ```

3. **SonarQube Connection Failed**
   ```
   Error: Cannot connect to SonarQube
   Solution: Verify SONAR_TOKEN, check SonarQube server
   ```

4. **Docker Build Failed**
   ```
   Error: Docker build failed
   Solution: Check Docker Desktop, verify ACR credentials
   ```

### Debug Mode
Set `skip_security_scan: true` to bypass security checks for testing.

## 🎉 Success Criteria

Your DevSecOps pipeline is working when:

- ✅ Security scans complete successfully
- ✅ Security gates pass
- ✅ Services build and deploy
- ✅ Security reports are generated
- ✅ Pipeline completes in reasonable time

## 🔮 Next Steps

After successful implementation:

1. **Add DAST**: Integrate OWASP ZAP for runtime testing
2. **Dependency Scanning**: Add OWASP Dependency Check
3. **Compliance**: Generate compliance reports
4. **Automation**: Schedule regular security scans
5. **Integration**: Connect to security dashboards

## 📞 Support

- Check workflow logs for detailed errors
- Review GitHub Actions documentation
- Contact DevOps team for assistance
- Create issues in repository for bugs

---

**Remember**: Security is a journey, not a destination. Continuously improve your DevSecOps pipeline!
