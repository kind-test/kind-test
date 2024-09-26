#! /usr/bin/env bash
# Initialize the ui-homepage service

# Enter the directory where this script is located
# So we can grab the chart/ directory
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

echo
echo -e "\e[32m ###### INITIALIZING UI-HOMEPAGE SERVICE #####\e[0m"
echo

helm upgrade -i ui-homepage ./chart
kubectl rollout status -n elasticdt deploy/ui-homepage --timeout=30s

echo
echo -e "\e[32m ui-homepage installed!\e[0m"
echo

popd