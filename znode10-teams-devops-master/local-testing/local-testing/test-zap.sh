#!/bin/bash
echo "🔍 Testing OWASP ZAP DAST..."

# Start a simple web server for testing
cd test-code
python3 -m http.server 8082 &
SERVER_PID=$!

# Wait for server to start
sleep 3

# Run ZAP scan
docker run --rm -v $(pwd)/../results:/zap/wrk \
  owasp/zap2docker-stable \
  zap-baseline.py \
  -t http://localhost:8082 \
  -J /zap/wrk/zap-report.json \
  -m 1

# Stop test server
kill $SERVER_PID

echo "✅ ZAP test completed"
