#! /usr/bin/env bash
# Remove dashboard

rm -f $(git root)/routes.d/neo4j

helm uninstall ds-neo4j
helm uninstall ds-neo4j-pre

ps aux | grep "[k]ubectl port-forward" | grep "svc/ds-neo4j" | awk '{print $2}' | xargs -n1 kill