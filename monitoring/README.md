# Prometheus + Grafana Monitoring Stack for Minikube

This directory contains a complete monitoring stack for your Minikube cluster, including Prometheus, Grafana, Alert Manager, Node Exporter, and Kube State Metrics.

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Grafana       │    │   Prometheus    │    │ Alert Manager   │
│   (Port 3000)   │◄──►│   (Port 9090)   │◄──►│   (Port 9093)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │  Kube State     │
                       │   Metrics       │
                       └─────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │  Node Exporter  │
                       │  (DaemonSet)    │
                       └─────────────────┘
```

## 📦 Components

### 1. **Prometheus** (Port 9090)
- **Purpose**: Metrics collection and storage
- **Features**: 
  - Kubernetes service discovery
  - Custom alerting rules
  - Persistent storage (10Gi)
  - RBAC permissions for cluster access

### 2. **Grafana** (Port 3000)
- **Purpose**: Metrics visualization and dashboards
- **Credentials**: `admin/admin`
- **Features**:
  - Pre-configured Prometheus datasource
  - Persistent storage (5Gi)
  - Ready for custom dashboards

### 3. **Alert Manager** (Port 9093)
- **Purpose**: Alert routing and notification
- **Features**:
  - Slack integration ready
  - Webhook support
  - Persistent storage (5Gi)

### 4. **Node Exporter** (DaemonSet)
- **Purpose**: Host-level metrics collection
- **Features**:
  - Runs on every node
  - Collects CPU, memory, disk, network metrics
  - Auto-discovered by Prometheus

### 5. **Kube State Metrics** (kube-system namespace)
- **Purpose**: Kubernetes cluster metrics
- **Features**:
  - Pod, deployment, service status
  - Resource usage metrics
  - Cluster health indicators

## 🚀 Quick Start

### Prerequisites
- Minikube running
- kubectl configured
- At least 2GB RAM available

### 1. Deploy the Stack
```bash
cd monitoring
chmod +x deploy-monitoring.sh
./deploy-monitoring.sh
```

### 2. Access the Services
- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3000 (admin/admin)
- **Alert Manager**: http://localhost:9093

### 3. Verify Deployment
```bash
kubectl get pods -n monitoring
kubectl get pods -n kube-system -l app=kube-state-metrics
```

## 📊 What You'll Monitor

### Infrastructure Metrics
- **Node Health**: CPU, memory, disk usage
- **Cluster Status**: Pod health, deployment status
- **Resource Usage**: Network, storage, performance

### Application Metrics (Ready for .NET Apps)
- **Custom Metrics**: Add Prometheus annotations to your .NET pods
- **Health Checks**: Application availability
- **Performance**: Response times, throughput

### Alerting Rules
- **Critical**: Node down, service unavailable
- **Warning**: High resource usage, pod restarts
- **Custom**: Application-specific alerts

## 🔧 Customization

### Adding .NET Application Metrics
1. **Add annotations to your .NET pods**:
```yaml
metadata:
  annotations:
    prometheus.io/scrape: "true"
    prometheus.io/port: "8080"
    prometheus.io/path: "/metrics"
```

2. **Expose metrics endpoint in your .NET app**:
```csharp
// Add Prometheus.NET package
app.UseMetricServer();
app.UseHttpMetrics();
```

### Custom Dashboards
1. **Import existing dashboards**:
   - Kubernetes Cluster Monitoring (ID: 315)
   - Node Exporter Full (ID: 1860)
   - Prometheus Stats (ID: 3662)

2. **Create custom dashboards** for your .NET applications

### Alert Rules
- Modify `prometheus-rules.yaml` to add custom alerts
- Configure Slack/webhook notifications in `alertmanager-config.yaml`

## 🧹 Cleanup

```bash
chmod +x cleanup-monitoring.sh
./cleanup-monitoring.sh
```

## 🔍 Troubleshooting

### Common Issues

1. **Pods not starting**:
   ```bash
   kubectl describe pod <pod-name> -n monitoring
   kubectl logs <pod-name> -n monitoring
   ```

2. **Storage issues**:
   ```bash
   kubectl get pvc -n monitoring
   kubectl get pv
   ```

3. **Port forwarding not working**:
   ```bash
   pkill -f 'kubectl port-forward'
   # Re-run deploy script
   ```

### Useful Commands
```bash
# Check all monitoring resources
kubectl get all -n monitoring

# View Prometheus targets
# Go to http://localhost:9090/targets

# Check Grafana datasources
# Go to http://localhost:3000/datasources

# View alert rules
kubectl get configmap prometheus-rules -n monitoring -o yaml
```

## 📚 Next Steps

1. **Import Grafana Dashboards** for Kubernetes monitoring
2. **Configure Slack/Teams notifications** in Alert Manager
3. **Add custom metrics** to your .NET applications
4. **Set up persistent dashboards** for your team
5. **Configure retention policies** for metrics storage

## 🆘 Support

- **Prometheus**: https://prometheus.io/docs/
- **Grafana**: https://grafana.com/docs/
- **Kubernetes Monitoring**: https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/

---

**Happy Monitoring! 📊🚀**




