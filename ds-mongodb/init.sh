#! /usr/bin/env bash
# Install MongoDB

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo add cowboysysop https://cowboysysop.github.io/charts/
# helm repo update
# mkdir -p $(git root)/mnt/data/mongodb

# Enter the directory where this script is located
# So we can grab secret.env and dump secret.yaml to the correct place
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

# Create the secret, pv, and pvc (pre-install chart)
echo
echo -e "\e[32m ###### DS-MONGODB PRE-INSTALL #####\e[0m"
echo
helm install ds-mongodb-pre ./pre

sleep 5

# Install the 3rd-party MongoDB chart
echo
echo -e "\e[32m ###### INITIALIZING DS-MONGODB SERVICE #####\e[0m"
echo
helm install ds-mongodb bitnami/mongodb --version 16.0.0 -f values/main.yaml
kubectl rollout status -n elasticdt statefulsets/ds-mongodb --timeout=60s

echo
echo -e "\e[32m ###### INITIALIZING DS-MONGODB-EXPRESS SERVICE #####\e[0m"
echo
helm install ds-mongodb-express cowboysysop/mongo-express --version 6.5.2 -f values/express.yaml

# Create the secret, pv, and pvc (pre-install chart)
echo
echo -e "\e[32m ###### DS-MONGODB POST-INSTALL #####\e[0m"
echo
helm install ds-mongodb-post ./post
