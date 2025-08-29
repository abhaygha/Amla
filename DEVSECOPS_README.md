# DevSecOps Implementation for Znode10 Teams DevOps

## Overview

This repository implements comprehensive DevSecOps practices using industry-standard open-source security tools. The implementation integrates security scanning into the CI/CD pipeline to ensure code quality, security, and compliance before deployment.

## 🚀 Security Tools Integrated

### 1. **SAST (Static Application Security Testing)**
- **Tool**: SonarQube
- **Purpose**: Code quality and security analysis
- **Features**:
  - Code smell detection
  - Security vulnerability identification
  - Code coverage analysis
  - Duplicate code detection
  - Technical debt tracking

### 2. **Secret Management**
- **Tool**: GitLeaks
- **Purpose**: Detect hardcoded secrets and credentials
- **Features**:
  - Azure Storage Account Keys
  - Database connection strings
  - API keys and tokens
  - JWT secrets
  - Custom regex patterns

### 3. **Image Scanning**
- **Tool**: Trivy
- **Purpose**: Container image vulnerability scanning
- **Features**:
  - Dockerfile security analysis
  - Container image scanning
  - OS package vulnerability detection
  - Configuration file analysis

### 4. **Dependency Check**
- **Tool**: OWASP Dependency Check
- **Purpose**: Third-party dependency vulnerability scanning
- **Features**:
  - .NET NuGet package analysis
  - CVE database integration
  - Severity-based reporting
  - False positive suppression

### 5. **DAST (Dynamic Application Security Testing)**
- **Tool**: OWASP ZAP
- **Purpose**: Runtime application security testing
- **Features**:
  - Spider crawling
  - Active vulnerability scanning
  - API security testing
  - Web application security assessment

## 🔧 Workflow Structure

### Main Security Workflow
- **File**: `.github/workflows/devsecops-security-scan.yaml`
- **Purpose**: Comprehensive security scanning for individual services
- **Triggers**: Called by build-deploy workflows

### Enhanced Build-Deploy Workflow
- **File**: `.github/workflows/build-deploy-secure.yaml`
- **Purpose**: Orchestrates security scanning, building, and deployment
- **Features**: Security gate enforcement

### Service-Specific Workflows
- **Files**: `dev1_build_deploy_secure.yml`, etc.
- **Purpose**: Trigger secure deployments for specific environments

## 📋 Prerequisites

### Required Secrets
```yaml
# GitHub Repository Secrets
ACCESS_REPO: Personal access token for cross-repo access
SONAR_TOKEN: SonarQube authentication token
TRIVY_USERNAME: Trivy registry username (optional)
TRIVY_PASSWORD: Trivy registry password (optional)
KUBECONFIG: Kubernetes configuration for deployment
```

### Required Variables
```yaml
# GitHub Repository Variables
SONAR_HOST_URL: SonarQube server URL (default: https://sonarcloud.io)
DEV_ACR_SERVER: Azure Container Registry for development
QA_ACR_SERVER: Azure Container Registry for QA
TARGET_URL: Target URL for DAST scanning
```

## 🚀 Usage

### 1. Manual Security Scan
```yaml
# Trigger security scanning for a specific service
name: Manual Security Scan
on:
  workflow_dispatch:
    inputs:
      service: "api"
      environment: "dev1"
      tenant: "z10"
      skip_security_scan: false
```

### 2. Secure Deployment
```yaml
# Deploy with security scanning enabled
name: Secure Deployment
on:
  workflow_dispatch:
    inputs:
      environment: "dev1"
      services: '{"api": true, "admin": true}'
      security_gate_enabled: true
      skip_security_scan: false
```

### 3. Skip Security Scanning (Not Recommended)
```yaml
# Only for emergency deployments
name: Emergency Deployment
on:
  workflow_dispatch:
    inputs:
      environment: "prod"
      services: '{"api": true}'
      skip_security_scan: true
      security_gate_enabled: false
```

## 🔒 Security Gates

### Critical Vulnerabilities
- **Blocking**: Critical CVSS 9.0+ vulnerabilities
- **Action**: Deployment blocked until resolved
- **Override**: Requires manual approval

### High Vulnerabilities
- **Warning**: CVSS 7.0-8.9 vulnerabilities
- **Action**: Warning displayed, deployment continues
- **Threshold**: More than 5 high vulnerabilities triggers warning

### Medium/Low Vulnerabilities
- **Reporting**: CVSS 4.0-6.9 and 0.1-3.9 vulnerabilities
- **Action**: Documented in reports
- **Tracking**: Monitored for trends

## 📊 Reports and Artifacts

### Generated Reports
1. **Security Summary**: Markdown summary of all scans
2. **SAST Reports**: SonarQube analysis results
3. **Secret Scan**: GitLeaks findings in SARIF format
4. **Dependency Reports**: OWASP Dependency Check results
5. **Image Scan**: Trivy vulnerability reports
6. **DAST Reports**: OWASP ZAP security assessment

### Report Formats
- **HTML**: Human-readable reports
- **JSON**: Machine-readable data
- **SARIF**: GitHub Security tab integration
- **Markdown**: Documentation and summaries

## 🛠️ Configuration Files

### GitLeaks Configuration
- **File**: `.gitleaks.toml`
- **Purpose**: Configure secret detection patterns
- **Customization**: Add/remove secret types

### OWASP Dependency Check Suppression
- **File**: `suppression.xml`
- **Purpose**: Suppress false positives
- **Usage**: Add known safe packages

### SonarQube Configuration
- **File**: Project-specific configuration
- **Purpose**: Customize code analysis rules
- **Integration**: Via SonarQube dashboard

## 🔄 Integration Points

### CI/CD Pipeline
1. **Code Checkout**: Repository cloning
2. **Security Scanning**: SAST, secrets, dependencies
3. **Image Building**: Docker container creation
4. **Image Scanning**: Trivy vulnerability analysis
5. **Deployment**: Kubernetes deployment
6. **Post-Deployment**: DAST and health checks

### GitHub Features
- **Security Tab**: SARIF report integration
- **Dependabot**: Automated dependency updates
- **Code Scanning**: Automated security analysis
- **Actions**: Workflow automation

## 📈 Monitoring and Metrics

### Security Metrics
- **Vulnerability Count**: By severity and type
- **Scan Coverage**: Percentage of code scanned
- **Fix Rate**: Time to resolve security issues
- **False Positive Rate**: Accuracy of scans

### Dashboard Integration
- **SonarQube**: Code quality metrics
- **GitHub Security**: Vulnerability tracking
- **Custom Dashboards**: Security KPIs

## 🚨 Incident Response

### Security Breach Response
1. **Immediate**: Stop affected deployments
2. **Assessment**: Analyze security scan results
3. **Remediation**: Fix identified vulnerabilities
4. **Verification**: Re-run security scans
5. **Deployment**: Resume secure deployment

### Escalation Matrix
- **Critical**: Security team + DevOps lead
- **High**: DevOps lead + Service owner
- **Medium**: Service owner
- **Low**: Automated tracking

## 🔧 Troubleshooting

### Common Issues

#### SonarQube Connection Failed
```bash
# Check token validity
curl -u $SONAR_TOKEN: https://sonarcloud.io/api/authentication/validate

# Verify project key format
echo "Project key: ${{ inputs.tenant }}-${{ inputs.service }}-${{ inputs.environment }}"
```

#### GitLeaks False Positives
```bash
# Update .gitleaks.toml with new patterns
# Add to allowlist for known safe patterns
# Use suppression for specific cases
```

#### Dependency Check Failures
```bash
# Check suppression.xml for false positives
# Update vulnerable packages
# Verify CVE database connectivity
```

#### Trivy Image Build Failures
```bash
# Ensure Docker daemon is running
# Check Dockerfile syntax
# Verify base image accessibility
```

#### OWASP ZAP Timeout
```bash
# Increase scan timeout values
# Reduce scan scope for large applications
# Use targeted scanning instead of full crawl
```

## 📚 Best Practices

### Security Scanning
1. **Regular Scans**: Run security scans on every deployment
2. **Baseline Establishment**: Set security thresholds
3. **False Positive Management**: Regular review and updates
4. **Tool Updates**: Keep security tools current

### Code Quality
1. **Automated Testing**: High test coverage
2. **Code Reviews**: Security-focused reviews
3. **Dependency Management**: Regular updates
4. **Documentation**: Security requirements and procedures

### Deployment Security
1. **Least Privilege**: Minimal required permissions
2. **Network Security**: Proper network segmentation
3. **Secret Management**: Use secure secret stores
4. **Monitoring**: Continuous security monitoring

## 🔮 Future Enhancements

### Planned Features
- **Container Signing**: Image integrity verification
- **Policy as Code**: Security policy automation
- **Compliance Reporting**: SOC2, PCI-DSS compliance
- **Threat Modeling**: Automated threat analysis
- **Security Training**: Developer security education

### Integration Roadmap
- **Slack/Teams**: Security notification integration
- **Jira**: Security issue tracking
- **Grafana**: Security metrics dashboard
- **ELK Stack**: Security log analysis

## 📞 Support

### Getting Help
1. **Documentation**: Review this README
2. **Issues**: Create GitHub issues
3. **Security Team**: Contact security team
4. **DevOps Team**: Contact DevOps team

### Contributing
1. **Security Improvements**: Submit pull requests
2. **Tool Updates**: Suggest new security tools
3. **Documentation**: Improve documentation
4. **Testing**: Test security workflows

---

## 🏆 Security Champions

This DevSecOps implementation is maintained by the DevOps and Security teams. For questions, suggestions, or improvements, please reach out to the team leads.

**Remember**: Security is everyone's responsibility. Secure code starts with secure development practices!

