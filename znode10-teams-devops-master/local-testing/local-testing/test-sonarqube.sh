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
