#! /usr/bin/env bash
# Uninstall the Traefik service

echo
echo -e "\e[32m ###### REMOVING TRAEFIK SERVICE #####\e[0m"
echo

helm uninstall traefik -n traefik
