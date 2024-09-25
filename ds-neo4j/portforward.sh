#! /usr/bin/env bash

# Port-forward the Traefik `web` and `traefik` (dashboard) entrypoints.
# We can find our process later with `ps aux | grep port-forward`.
nohup kubectl port-forward -n elasticdt svc/ds-neo4j 7474:7474 &>/dev/null &
nohup kubectl port-forward -n elasticdt svc/ds-neo4j 7687:7687 &>/dev/null &

# show the running kubectl port-forward processes
ps aux | grep "[k]ubectl port-forward" | grep svc/ds-neo4j
