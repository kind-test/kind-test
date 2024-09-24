#! /usr/bin/env bash
# Install MySQL


# Enter the directory where this script is located
# So we can grab secret.env and dump secret.yaml to the correct place
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"


# Create the minikube mount.  Note that the pod will fail if the UID or GID is incorrect.
echo
echo -e "\e[32m Mounting data...\e[0m"
nohup minikube mount mnt:/mnt/elasticdt/mysql_data --uid=1001 --gid=0 &>/dev/null &
# show the new mount process
ps aux | grep "[m]inikube mount" | grep "elasticdt/mysql_data"
echo


# Create the secret, pv, and pvc (pre-install chart)
echo
echo -e "\e[32m ###### DS-MYSQL PRE-INSTALL #####\e[0m"
echo
helm install ds-mysql-pre ./pre -f values/pre.yaml


# Install the 3rd-party MySQL chart
echo
echo -e "\e[32m ###### INITIALIZING DS-MYSQL SERVICE #####\e[0m"
echo
helm install ds-mysql bitnami/mysql --version 9.3.3 -f values/main.yaml
# Wait for the rollout to succeed
kubectl rollout status -n elasticdt statefulsets/ds-mysql --timeout=60s


# Install the 3rd-party PHPMyAdmin chart
echo
echo -e "\e[32m ###### INITIALIZING DS-MYSQL-PHPMYADMIN SERVICE #####\e[0m"
echo
helm install ds-mysql-phpmyadmin bitnami/phpmyadmin --version 17.0.7 -f values/phpmyadmin.yaml


# Create the HTTPRoute (post-install chart)

echo
echo -e "\e[32m ds-mysql installed!\e[0m"
echo

popd