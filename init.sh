#!/usr/bin/env bash
# Initialize the cluster

# Enter the directory where this script is located
# so we can find the init.sh scripts of our services
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

echo
echo -e "\e[32m ###### INITIALIZING ELASTICDT MINIKUBE CLUSTER #####\e[0m"
echo

# Start minikube
minikube start \
   --addons=dashboard \
   --addons=metrics-server \
   --cpus=8 \
   --memory=16g \
   --profile=elasticdt \
   --namespace=elasticdt

# Set the minikube profile
minikube profile elasticdt

# Create the elasticdt namespace
kubectl create ns elasticdt

# Wait for a pod to become ready
kubectl rollout status -n kubernetes-dashboard deploy/kubernetes-dashboard --timeout=30s

# Launch initial set of services
./traefik/init.sh
./whoami/init.sh

# Go back to the calling directory
popd