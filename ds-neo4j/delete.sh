#! /usr/bin/env bash
# Remove dashboard

helm uninstall ds-neo4j
helm uninstall ds-neo4j-pre

ps aux | grep "[k]ubectl port-forward" | grep "svc/ds-neo4j" | awk '{print $2}' | xargs -n1 kill