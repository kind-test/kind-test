#! /usr/bin/env bash
# Install dashboard

# helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
# helm repo update

echo 'Installing Helm chart for Kubernetes dashboard...'
echo

helm install dashboard kubernetes-dashboard/kubernetes-dashboard \
-n monitoring --create-namespace \
--set metrics-server.enabled=true --wait --timeout 60s

kubectl -n monitoring create \
clusterrolebinding dashboard-kubernetes-dashboard \
--clusterrole=cluster-admin \
--serviceaccount=monitoring:default


echo "Kubernetes dashboard installed in the current \"$(kubectl config current-context)\" context."
echo
echo "Use the following bearer token to login:"
kubectl -n monitoring create token default --duration 8760h | tee ~/kind-dashboard-token
echo
echo
