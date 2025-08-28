#!/bin/bash

# === INPUT VARIABLES ===
API_SERVER_IP="$1"                 # e.g. 172.16.100.99
CONTEXT_NAME="$2"                  # e.g. readonly-context
OUTPUT_PATH="$3"                   # e.g. /root/.kube/read-only-etna-dev-100.99
NAMESPACE="znode"                  # Namespace to restrict access to
SA_NAME="read-only"               # ServiceAccount name
ROLE_NAME="readonly-role-${NAMESPACE}"
SECRET_NAME="${SA_NAME}-token"

# === CHECK ===
if [[ -z "$API_SERVER_IP" || -z "$CONTEXT_NAME" || -z "$OUTPUT_PATH" ]]; then
  echo "Usage: $0 <API_SERVER_IP> <CONTEXT_NAME> <OUTPUT_PATH>"
  exit 1
fi

echo "🔧 Creating namespace-scoped read-only Role and ServiceAccount..."

# Create Role
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: ${NAMESPACE}
  name: ${ROLE_NAME}
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["get", "list", "watch"]
EOF

# Create ServiceAccount
kubectl create serviceaccount ${SA_NAME} -n ${NAMESPACE} --dry-run=client -o yaml | kubectl apply -f -

# Create RoleBinding
kubectl create rolebinding readonly-binding-${SA_NAME} \
  --role=${ROLE_NAME} \
  --serviceaccount=${NAMESPACE}:${SA_NAME} \
  --namespace=${NAMESPACE} --dry-run=client -o yaml | kubectl apply -f -

# Create Secret for token
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: ${SECRET_NAME}
  namespace: ${NAMESPACE}
  annotations:
    kubernetes.io/service-account.name: ${SA_NAME}
type: kubernetes.io/service-account-token
EOF

# Wait for token to populate
echo "⏳ Waiting for token to be ready..."
sleep 10

# Extract token and cluster info
TOKEN=$(kubectl get secret ${SECRET_NAME} -n ${NAMESPACE} -o jsonpath='{.data.token}' | base64 -d)
CA_CERT=$(cat /etc/kubernetes/pki/ca.crt | base64 | tr -d '\n')

# Write kubeconfig
echo "📝 Writing kubeconfig to $OUTPUT_PATH"

cat <<EOF > "${OUTPUT_PATH}"
apiVersion: v1
kind: Config
clusters:
- name: readonly-cluster
  cluster:
    server: https://${API_SERVER_IP}:6443
    certificate-authority-data: ${CA_CERT}
users:
- name: ${SA_NAME}
  user:
    token: ${TOKEN}
contexts:
- name: ${CONTEXT_NAME}
  context:
    cluster: readonly-cluster
    user: ${SA_NAME}
    namespace: ${NAMESPACE}
current-context: ${CONTEXT_NAME}
EOF

echo "✅ Kubeconfig created successfully at ${OUTPUT_PATH}"
root@amla-Virtual-Machine:~# cat read-onlly-restart.sh
#!/bin/bash

# === INPUT VARIABLES ===
API_SERVER_IP="$1"                 # e.g. 172.16.100.99
CONTEXT_NAME="$2"                  # e.g. restart-context
OUTPUT_PATH="$3"                   # e.g. /root/.kube/restart-role-etna-dev-100.99
NAMESPACE="znode"                  # Namespace to scope access
SA_NAME="restart-role"             # ServiceAccount name
ROLE_NAME="restart-role-${NAMESPACE}"
SECRET_NAME="${SA_NAME}-token"

# === CHECK ===
if [[ -z "$API_SERVER_IP" || -z "$CONTEXT_NAME" || -z "$OUTPUT_PATH" ]]; then
  echo "Usage: $0 <API_SERVER_IP> <CONTEXT_NAME> <OUTPUT_PATH>"
  exit 1
fi

echo "🔧 Creating Role for restart+readonly in namespace: ${NAMESPACE}"

# Create Role
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: ${NAMESPACE}
  name: ${ROLE_NAME}
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["apps"]
  resources: ["deployments", "statefulsets"]
  verbs: ["patch"]
EOF

# Create ServiceAccount
kubectl create serviceaccount ${SA_NAME} -n ${NAMESPACE} --dry-run=client -o yaml | kubectl apply -f -

# Create RoleBinding
kubectl create rolebinding ${SA_NAME}-binding \
  --role=${ROLE_NAME} \
  --serviceaccount=${NAMESPACE}:${SA_NAME} \
  --namespace=${NAMESPACE} --dry-run=client -o yaml | kubectl apply -f -

# Create Secret for token
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: ${SECRET_NAME}
  namespace: ${NAMESPACE}
  annotations:
    kubernetes.io/service-account.name: ${SA_NAME}
type: kubernetes.io/service-account-token
EOF

# Wait for token to populate
echo "⏳ Waiting for token to be ready..."
sleep 10

# Extract token and cluster details
TOKEN=$(kubectl get secret ${SECRET_NAME} -n ${NAMESPACE} -o jsonpath='{.data.token}' | base64 -d)
CA_CERT=$(cat /etc/kubernetes/pki/ca.crt | base64 | tr -d '\n')

# Write kubeconfig
echo "📝 Writing kubeconfig to $OUTPUT_PATH"

cat <<EOF > "${OUTPUT_PATH}"
apiVersion: v1
kind: Config
clusters:
- name: restart-cluster
  cluster:
    server: https://${API_SERVER_IP}:6443
    certificate-authority-data: ${CA_CERT}
users:
- name: ${SA_NAME}
  user:
    token: ${TOKEN}
contexts:
- name: ${CONTEXT_NAME}
  context:
    cluster: restart-cluster
    user: ${SA_NAME}
    namespace: ${NAMESPACE}
current-context: ${CONTEXT_NAME}
EOF

echo "✅ Restart-enabled kubeconfig created at ${OUTPUT_PATH}"