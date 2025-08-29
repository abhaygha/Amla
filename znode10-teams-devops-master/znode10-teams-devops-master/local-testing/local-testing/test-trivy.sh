#!/bin/bash
echo "🔍 Testing Trivy Image Scanning..."

# Build test image
cd test-code
docker build -t test-image:latest .

# Scan the image
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/../results:/report \
  aquasec/trivy:latest \
  image test-image:latest \
  --format json \
  --output /report/trivy-image.json \
  --severity HIGH,CRITICAL

# Clean up
docker rmi test-image:latest

echo "✅ Trivy test completed"
