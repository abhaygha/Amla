# DevSecOps Implementation Guide

## Overview

This repository implements a comprehensive DevSecOps pipeline using GitHub Actions with Windows self-hosted runners. The pipeline integrates three core security tools:

1. **SAST (Static Application Security Testing)** - SonarQube
2. **Secret Management** - GitLeaks
3. **Image Scanning** - Trivy

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    DevSecOps Pipeline                      │
├─────────────────────────────────────────────────────────────┤
│ 1. Parse Services Configuration                           │
│ 2. Security Scanning Phase                                │
│    ├── SAST (SonarQube)                                  │
│    ├── Secret Management (GitLeaks)                      │
│    └── Image Scanning (Trivy)                            │
│ 3. Security Gate Check                                    │
│ 4. Build Services (if security passes)                    │
│ 5. Deploy Services (if security passes)                   │
│ 6. Security Summary Report                                │
└─────────────────────────────────────────────────────────────┘
```

## 🔧 Tools Used

### 1. SAST - SonarQube
- **Purpose**: Static code analysis for .NET applications
- **Features**: 
  - Code quality analysis
  - Security vulnerability detection
  - Code smell identification
  - Technical debt tracking
- **Integration**: Uses `dotnet-sonarscanner` for .NET projects

### 2. Secret Management - GitLeaks
- **Purpose**: Detect hardcoded secrets and credentials
- **Features**:
  - Scans repository for API keys, passwords, tokens
  - Supports multiple secret formats
  - JSON report generation
  - Configurable rules
- **Integration**: Downloads and runs GitLeaks for Windows

### 3. Image Scanning - Trivy
- **Purpose**: Container image and Dockerfile vulnerability scanning
- **Features**:
  - OS package vulnerability detection
  - Language-specific dependency scanning
  - Dockerfile misconfiguration detection
  - JSON report generation
- **Integration**: Downloads and runs Trivy for Windows

## 📁 File Structure

```
.github/
├── workflows/
│   ├── devsecops-core.yaml           # Core security scanning workflow
│   ├── build-deploy-secure.yaml      # Main orchestration workflow
│   ├── build-service.yaml            # Service building workflow
│   ├── deploy-service.yaml           # Service deployment workflow
│   └── dev1_build_deploy_secure.yml # Dev1 environment trigger
├── services-config.json              # Services configuration
└── README.md                         # This file
```

## 🚀 Getting Started

### Prerequisites

1. **Windows Self-Hosted Runner**
   - Must be configured and running
   - Should have .NET 8.0 SDK installed
   - Should have Docker Desktop installed
   - Should have kubectl configured

2. **GitHub Secrets**
   - `ACCESS_REPO`: GitHub Personal Access Token
   - `SONAR_TOKEN`: SonarQube authentication token
   - `TRIVY_USERNAME`: Trivy registry username
   - `TRIVY_PASSWORD`: Trivy registry password
   - `KUBECONFIG`: Kubernetes configuration
   - `DEV_ACRUN`: Development ACR username
   - `DEV_ACRPW`: Development ACR password
   - `QA_ACRUN`: QA ACR username
   - `QA_ACRPW`: QA ACR password

3. **GitHub Variables**
   - `DEV_ACR_SERVER`: Development ACR server URL
   - `QA_ACR_SERVER`: QA ACR server URL
   - `IMAGE_REGISTRY`: Container registry URL

### Running the Pipeline

1. **Manual Trigger**
   - Go to Actions tab in GitHub
   - Select "Trigger - Z10 DEV1 with DevSecOps"
   - Click "Run workflow"
   - Fill in the required parameters

2. **Parameters**
   - `tenant`: Tenant name (default: z10)
   - `environment`: Target environment (default: dev1)
   - `branch`: Git branch to deploy (default: int)
   - `namespace`: Kubernetes namespace (default: znode)
   - `services`: JSON object of services to deploy
   - `all`: Deploy all services (default: false)
   - `skip_security_scan`: Skip security scanning (default: false)
   - `security_gate_enabled`: Enable security gate (default: true)

## 🔒 Security Gates

The pipeline implements security gates that can block deployment if:

1. **SAST Analysis Fails**: Critical code quality or security issues
2. **Secrets Detected**: Hardcoded credentials or API keys found
3. **Vulnerabilities Found**: Critical or high-severity vulnerabilities in Dockerfiles

### Security Gate Configuration

- **Enabled by default**: `security_gate_enabled: true`
- **Can be disabled**: Set to `false` for testing
- **Blocks deployment**: If any security tool fails
- **Provides reports**: Detailed findings in workflow artifacts

## 📊 Reports and Artifacts

### Security Reports
- **SAST Report**: SonarQube analysis results
- **GitLeaks Report**: Secret detection findings
- **Trivy Report**: Vulnerability scan results
- **Security Summary**: Overall pipeline status

### Artifact Retention
- **Security Reports**: 30 days
- **Build Artifacts**: 30 days
- **Deployment Logs**: 30 days

## 🛠️ Customization

### Adding New Services
1. Update `.github/services-config.json`
2. Add service configuration with:
   - Repository URL
   - Working directory
   - Docker compose file

### Modifying Security Rules
1. **SonarQube**: Configure quality gates in SonarQube server
2. **GitLeaks**: Customize detection rules in workflow
3. **Trivy**: Adjust severity thresholds for vulnerabilities

### Environment-Specific Configuration
- Different ACR servers for dev/qa/prod
- Environment-specific Kubernetes namespaces
- Custom security policies per environment

## 🔍 Troubleshooting

### Common Issues

1. **Runner Not Available**
   - Check runner status in GitHub
   - Verify Windows service is running
   - Check network connectivity

2. **Security Tool Failures**
   - Review tool-specific logs
   - Check required secrets are configured
   - Verify tool versions are compatible

3. **Build Failures**
   - Check Docker Desktop is running
   - Verify ACR credentials
   - Check service configuration

### Debug Mode
- Set `skip_security_scan: true` to bypass security checks
- Review workflow logs for detailed error information
- Check artifact uploads for tool outputs

## 🔮 Future Enhancements

### Planned Features
1. **DAST Integration**: OWASP ZAP for runtime testing
2. **Dependency Scanning**: OWASP Dependency Check for .NET
3. **Compliance Reporting**: Generate compliance reports
4. **Slack/Teams Integration**: Real-time notifications
5. **Security Dashboard**: Centralized security metrics

### Advanced Security
1. **Container Signing**: Sign and verify container images
2. **Policy as Code**: Security policies in YAML
3. **Automated Remediation**: Auto-fix common issues
4. **Security Metrics**: Track security posture over time

## 📞 Support

For issues or questions:
1. Check workflow logs for detailed error information
2. Review GitHub Actions documentation
3. Contact the DevOps team
4. Create an issue in this repository

## 📚 Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [SonarQube Documentation](https://docs.sonarqube.org/)
- [GitLeaks Documentation](https://github.com/zricethezav/gitleaks)
- [Trivy Documentation](https://aquasecurity.github.io/trivy/)
- [DevSecOps Best Practices](https://owasp.org/www-project-devsecops-maturity-model/)
