#! /usr/bin/env bash
# Initialize the whoami service

# Enter the directory where this script is located
# So we can grab the chart/ directory
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

echo
echo -e "\e[32m ###### INITIALIZING WHOAMI SERVICE #####\e[0m"
echo

helm upgrade -i whoami ./chart
kubectl rollout status -n elasticdt deploy/whoami --timeout=30s

echo
echo -e "\e[32m whoami installed!\e[0m"
echo

popd