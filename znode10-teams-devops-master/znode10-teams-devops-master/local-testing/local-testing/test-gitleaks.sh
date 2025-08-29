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
