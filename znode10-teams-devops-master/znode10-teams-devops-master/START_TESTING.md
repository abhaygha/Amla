# 🚀 Start Testing DevSecOps Locally - RIGHT NOW!

## ⚡ Quick Start (Choose Your Platform)

### 🐧 Linux/Mac Users
```bash
# Navigate to the local testing directory
cd znode10-teams-devops-master/znode10-teams-devops-master/local-testing

# Run the quick test (recommended for first time)
./quick-test.sh

# OR run the comprehensive test
./run-all-tests.sh
```

### 🪟 Windows Users
```powershell
# Navigate to the local testing directory
cd znode10-teams-devops-master\znode10-teams-devops-master\local-testing

# Run the PowerShell test
.\quick-test.ps1

# OR run the batch file
.\run-tests.bat
```

## 🔧 Prerequisites Check

Before running, ensure you have:

- ✅ **Docker Desktop** running
- ✅ **Docker Compose** available
- ✅ **Ports 9000, 8080, 8081** free
- ✅ **.NET 7.0 SDK** (for SAST testing)
- ✅ **Python 3.x** or **Node.js** (for DAST testing)

## 📊 What You'll Test

1. **🔍 GitLeaks** - Secret detection in your code
2. **🔍 SonarQube** - SAST analysis of .NET code
3. **🔍 OWASP Dependency Check** - Vulnerability scanning
4. **🔍 Trivy** - Container image security
5. **🔍 OWASP ZAP** - DAST testing

## 🌐 Access Points After Testing

- **SonarQube Dashboard**: http://localhost:9000 (admin/admin)
- **All Reports**: `results/` directory
- **Summary Report**: `results/test-summary.md`

## 🚨 Troubleshooting

### Port Already in Use
```bash
# Check what's using the port
lsof -i :9000  # Linux/Mac
netstat -an | findstr :9000  # Windows

# Stop the service or modify docker-compose.yml
```

### Docker Not Running
```bash
# Start Docker Desktop
# Wait for it to be fully running
docker info
```

### Permission Denied
```bash
# Make scripts executable
chmod +x *.sh
```

## 🧹 Cleanup

```bash
# Stop all services
docker-compose down

# Remove test images
docker rmi test-image:latest

# Clean results
rm -rf results/*
```

## 📈 Next Steps After Testing

1. **Review Results**: Check all security reports
2. **Customize Rules**: Modify `.gitleaks.toml` and `suppression.xml`
3. **Push to GitHub**: Test the real workflows
4. **Configure Secrets**: Set up GitHub repository secrets
5. **Integrate**: Use in your existing CI/CD pipeline

## 🆘 Need Help?

- Check the `local-testing/README.md` for detailed instructions
- Review logs in the `logs/` directory
- Check individual tool documentation
- Create GitHub issues for problems

---

## 🎯 Your Testing Journey

```
Start Here → Run Quick Test → Review Results → Customize → Push to GitHub
     ↓              ↓              ↓           ↓           ↓
  Setup        5 Security      Reports     Rules      Production
Complete        Tools Test     Generated   Adjusted   Ready
```

**Ready to test? Just run one of the commands above! 🚀**

