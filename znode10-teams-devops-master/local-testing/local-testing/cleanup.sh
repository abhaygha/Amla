#!/bin/bash
echo "🧹 Cleaning up test environment..."

# Stop and remove containers
docker-compose down -v

# Remove test images
docker rmi test-image:latest 2>/dev/null || true

# Clean up test files
rm -rf results/*
rm -rf logs/*

echo "✅ Cleanup completed!"
