#!/bin/bash

echo "🧹 Cleaning up Prometheus + Grafana Monitoring Stack..."

# Stop port forwarding
echo "🛑 Stopping port forwarding..."
pkill -f 'kubectl port-forward' 2>/dev/null || true

# Delete monitoring namespace (this will delete all resources)
echo "🗑️  Deleting monitoring namespace..."
kubectl delete namespace monitoring --ignore-not-found=true

# Delete kube-state-metrics from kube-system namespace
echo "🗑️  Deleting kube-state-metrics..."
kubectl delete -f kube-state-metrics/ --ignore-not-found=true

# Delete Loki and Promtail
echo "🗑️  Deleting Loki and Promtail..."
kubectl delete -f loki/ --ignore-not-found=true

echo "✅ Monitoring stack cleaned up successfully!"
echo ""
echo "💡 To redeploy, run: ./deploy-monitoring.sh"



