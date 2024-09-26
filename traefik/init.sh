#! /usr/bin/env bash
# Initialize the Traefik service

# helm repo add traefik https://traefik.github.io/charts
# helm repo update

# Enter the directory where this script is located
# So we can grab the values.yaml file
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

echo
echo -e "\e[32m ###### INITIALIZING TRAEFIK SERVICE #####\e[0m"
echo

helm repo add traefik https://traefik.github.io/charts
helm repo update
kubectl create namespace traefik

helm upgrade --install --version 31.1.1 --namespace traefik traefik traefik/traefik -f values.yaml

# Wait for the rollout to succeed
kubectl rollout status -n traefik deploy/traefik --timeout=30s

echo
echo -e "\e[32m Traefik installed!\e[0m"
echo -e "\e[32m Run the traefik/portforward.sh script to complete setup.\e[0m"
echo

# Go back to the calling directory
popd