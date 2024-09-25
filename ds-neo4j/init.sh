#! /usr/bin/env bash
# Install Neo4j

# helm repo add neo4j https://helm.neo4j.com/neo4j
# helm repo update

# Enter the directory where this script is located
# So we can grab secret.env and dump secret.yaml to the correct place
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

# mkdir -p $(git root)/mnt/data/neo4j

# Create the secret, pv, and pvc (pre-install chart)
echo
echo -e "\e[32m ###### DS-NEO4J PRE-INSTALL #####\e[0m"
echo
helm install ds-neo4j-pre ./pre

sleep 5

# Install the 3rd-party MySQL chart
echo
echo -e "\e[32m ###### INITIALIZING DS-NEO4J SERVICE #####\e[0m"
echo
helm install ds-neo4j neo4j/neo4j --version 5.23 -f values.yaml
kubectl rollout status -n elasticdt statefulsets/ds-neo4j --timeout=60s

echo -e "Neo4j browser\n:7474/browser/" > $(git root)/routes.d/neo4j
