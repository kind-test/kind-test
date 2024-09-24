#! /usr/bin/env bash
# Unnstall MySQL

helm uninstall ds-mysql-phpmyadmin
helm uninstall ds-mysql
helm uninstall ds-mysql-pre

# Stop the minikube mount
# "awk '{print $2}'" gets the process ID
ps aux | grep "[m]inikube mount" | grep "elasticdt/mysql_data" | awk '{print $2}' | xargs -n1 kill
