#!/usr/bin/env bash
# Initialize the cluster

# Enter the directory where this script is located
# so we can find the init.sh scripts of our services
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

echo
echo -e "\e[32m ###### INITIALIZING ELASTICDT CLUSTER #####\e[0m"
echo

# Start kind
kind create cluster -n elasticdt --config kind.yaml
kubectl config use-context kind-elasticdt

# Create the elasticdt namespace
kubectl create ns elasticdt
kubectl config set-context --current --namespace=elasticdt

# Launch initial set of services
./dashboard/init.sh
./traefik/init.sh
./whoami/init.sh
./ds-mysql/init.sh
./ui-homepage/init.sh

# Go back to the calling directory
popd