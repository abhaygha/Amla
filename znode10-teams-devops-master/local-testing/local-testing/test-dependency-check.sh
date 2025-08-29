#!/bin/bash
echo "🔍 Testing OWASP Dependency Check..."

# Run dependency check
docker run --rm -v $(pwd)/test-code:/src -v $(pwd)/results:/report \
  owasp/dependency-check:latest \
  --scan /src \
  --format "HTML" "JSON" "SARIF" \
  --out /report \
  --suppression /src/suppression.xml \
  --failOnCVSS 7 \
  --enableRetired \
  --prettyPrint

echo "✅ Dependency Check test completed"
