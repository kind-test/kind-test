#! /usr/bin/env bash
# Install MySQL

# Enter the directory where this script is located
# So we can grab secret.env and dump secret.yaml to the correct place
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo update
# mkdir -p $(git root)/mnt/data/mysql

# Create the secret, pv, and pvc (pre-install chart)
echo
echo -e "\e[32m ###### DS-MYSQL PRE-INSTALL #####\e[0m"
echo
helm install ds-mysql-pre ./pre

sleep 5

# Install the 3rd-party MySQL chart
echo
echo -e "\e[32m ###### INITIALIZING DS-MYSQL SERVICE #####\e[0m"
echo
helm install ds-mysql bitnami/mysql --version 9.3.3 -f values/main.yaml
kubectl rollout status -n elasticdt statefulsets/ds-mysql --timeout=60s

# Install the 3rd-party PHPMyAdmin chart.
#
# Somehow using an IP address for `db.host` fixes some DNS problems we had when using
# `ds-mysql` as the value instead
echo
echo -e "\e[32m ###### INITIALIZING DS-MYSQL-PHPMYADMIN SERVICE #####\e[0m"
echo
helm install ds-mysql-phpmyadmin bitnami/phpmyadmin --version 17.0.7 -f values/phpmyadmin.yaml \
  --set db.host=$(kubectl get svc ds-mysql -o yaml | yq '.spec.clusterIP')

# Wait for the rollout to succeed
echo
echo -e "\e[32m Wait for rollouts...\e[0m"
echo
kubectl rollout status -n elasticdt deploy/ds-mysql-phpmyadmin --timeout=60s


# Create the HTTPRoute (post-install chart)
echo
echo -e "\e[32m ###### DS-MYSQL POST-INSTALL #####\e[0m"
echo
helm install ds-mysql-post ./post

echo
echo -e "\e[32m ds-mysql installed!\e[0m"
echo

popd