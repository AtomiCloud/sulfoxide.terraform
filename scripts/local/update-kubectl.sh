#!/usr/bin/env bash

set -eou pipefail

cluster_prefix=$(echo "$CLUSTER" | tr '[:lower:]' '[:upper:]')
L=$(echo "$LANDSCAPE" | tr '[:upper:]' '[:lower:]')
C=$(echo "$CLUSTER" | tr '[:upper:]' '[:lower:]')

name="${L}-${C}"
do_cluster="${L}-${C}-cluster"
kctx_cluster="do-sgp1-${do_cluster}"

echo "🛠️ Attempting to generate kubeconfig cluster '$name'..."

# retrieve digital ocean token
token="$(doppler secrets get "${cluster_prefix}_DIGITALOCEAN_TOKEN" -p "sulfoxide-terraform" -c "${L}" --plain)"

kubeconfig_path="${HOME}/.kube/k3dconfigs/${name}"
echo "📝 Writing to '${kubeconfig_path}'"

kubeconfig="$(doctl -t "${token}" kubernetes cluster kubeconfig show "${do_cluster}" | sd "${kctx_cluster}" "${name}")"
echo "${kubeconfig}" >"${kubeconfig_path}"

endpoint="$(echo "${kubeconfig}" | yq -r '.clusters[0].cluster.server')"
echo "🔗 Endpoint: ${endpoint}"
# merging kubeconfig
echo "🛠️ Attempting to merge kubeconfig cluster '$name'..."
KUBECONFIG=$(cd ~/.kube/configs && find "$(pwd)"/* | awk 'ORS=":"')$(cd ~/.kube/k3dconfigs && find "$(pwd)"/* | awk 'ORS=":"') kubectl config view --flatten >~/.kube/config
chmod 600 ~/.kube/config
echo "✅ Config is merged!"
