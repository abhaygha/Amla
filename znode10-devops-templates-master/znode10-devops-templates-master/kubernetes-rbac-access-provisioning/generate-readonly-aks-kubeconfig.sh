#!/bin/bash

# === CONFIG ===
NAMESPACE="znode"
SA_NAME="readonly-sa"
ROLE_NAME="readonly-role"
ROLE_BINDING_NAME="readonly-binding"
SECRET_NAME="${SA_NAME}-token"
KUBECONFIG_FILE="readonly-kubeconfig.yaml"
CONTEXT_NAME="readonly-context"
API_SERVER=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')

echo "🔧 Creating namespace $NAMESPACE (if not exists)..."
kubectl get ns $NAMESPACE >/dev/null 2>&1 || kubectl create ns $NAMESPACE

echo "📌 Creating read-only Role..."
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: $NAMESPACE
  name: $ROLE_NAME
rules:
- apiGroups: ["", "apps", "batch", "networking.k8s.io", "extensions", "policy", "autoscaling", "rbac.authorization.k8s.io", "storage.k8s.io"]
  resources: ["*"]
  verbs: ["get", "list", "watch"]
EOF

echo "🔐 Creating ServiceAccount..."
kubectl create sa $SA_NAME -n $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

echo "🔗 Binding Role to ServiceAccount..."
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: $ROLE_BINDING_NAME
  namespace: $NAMESPACE
subjects:
- kind: ServiceAccount
  name: $SA_NAME
  namespace: $NAMESPACE
roleRef:
  kind: Role
  name: $ROLE_NAME
  apiGroup: rbac.authorization.k8s.io
EOF

echo "🔑 Creating token secret for the ServiceAccount..."
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: $SECRET_NAME
  namespace: $NAMESPACE
  annotations:
    kubernetes.io/service-account.name: $SA_NAME
type: kubernetes.io/service-account-token
EOF

echo "⏳ Waiting for token to populate..."
sleep 10

# Extract token and CA
TOKEN=$(kubectl get secret $SECRET_NAME -n $NAMESPACE -o jsonpath='{.data.token}' | base64 -d)
CA_CRT=$(kubectl get secret $SECRET_NAME -n $NAMESPACE -o jsonpath='{.data.ca\.crt}')

echo "📝 Generating kubeconfig file: $KUBECONFIG_FILE"
cat <<EOF > $KUBECONFIG_FILE
apiVersion: v1
kind: Config
clusters:
- name: aks-cluster
  cluster:
    server: $API_SERVER
    certificate-authority-data: $CA_CRT
contexts:
- name: $CONTEXT_NAME
  context:
    cluster: aks-cluster
    namespace: $NAMESPACE
    user: readonly-user
current-context: $CONTEXT_NAME
preferences: {}
users:
- name: readonly-user
  user:
    token: $TOKEN
EOF

echo "✅ Done! Kubeconfig saved to: $KUBECONFIG_FILE"
echo "👉 Try it with:"
echo "   KUBECONFIG=$KUBECONFIG_FILE kubectl get all"