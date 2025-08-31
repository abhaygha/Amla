#!/bin/bash

echo "🚀 Deploying Prometheus + Grafana Monitoring Stack to Minikube..."

# Create namespace
echo "📦 Creating monitoring namespace..."
kubectl apply -f namespace.yaml

# Wait for namespace to be ready
kubectl wait --for=condition=Active namespace/monitoring --timeout=60s

# Deploy Prometheus components
echo "📊 Deploying Prometheus..."
kubectl apply -f prometheus/
kubectl wait --for=condition=available --timeout=300s deployment/prometheus -n monitoring

# Deploy Alert Manager
echo "🚨 Deploying Alert Manager..."
kubectl apply -f alertmanager/
kubectl wait --for=condition=available --timeout=300s deployment/alertmanager -n monitoring

# Deploy Node Exporter
echo "🖥️ Deploying Node Exporter..."
kubectl apply -f node-exporter/
kubectl wait --for=condition=available --timeout=300s daemonset/node-exporter -n monitoring

# Deploy Kube State Metrics
echo "📈 Deploying Kube State Metrics..."
kubectl apply -f kube-state-metrics/
kubectl wait --for=condition=available --timeout=300s deployment/kube-state-metrics -n kube-system

# Deploy Grafana
echo "📊 Deploying Grafana..."
kubectl apply -f grafana/
kubectl wait --for=condition=available --timeout=300s deployment/grafana -n monitoring

# Wait for all pods to be ready
echo "⏳ Waiting for all pods to be ready..."
kubectl wait --for=condition=ready pod -l app=prometheus -n monitoring --timeout=300s
kubectl wait --for=condition=ready pod -l app=grafana -n monitoring --timeout=300s
kubectl wait --for=condition=ready pod -l app=alertmanager -n monitoring --timeout=300s

# Deploy Loki and Promtail
echo "📦 Deploying Loki and Promtail..."
kubectl apply -f loki/
kubectl wait --for=condition=available --timeout=300s deployment/loki -n monitoring || true
kubectl wait --for=condition=available --timeout=300s daemonset/promtail -n monitoring || true

# Port forward services for local access
echo "🔗 Setting up port forwarding..."
echo "Prometheus: http://localhost:9090"
echo "Grafana: http://localhost:3000 (admin/admin)"
echo "Alert Manager: http://localhost:9093"

# Start port forwarding in background
kubectl port-forward -n monitoring svc/prometheus 9090:9090 &
kubectl port-forward -n monitoring svc/grafana 3000:3000 &
kubectl port-forward -n monitoring svc/alertmanager 9093:9093 &

echo "✅ Monitoring stack deployed successfully!"
echo ""
echo "📊 Access URLs:"
echo "   Prometheus: http://localhost:9090"
echo "   Grafana: http://localhost:3000 (admin/admin)"
echo "   Alert Manager: http://localhost:9093"
echo ""
echo "🔄 To stop port forwarding, run: pkill -f 'kubectl port-forward'"
echo "🗑️  To clean up, run: kubectl delete namespace monitoring"


