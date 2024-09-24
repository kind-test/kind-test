#! /usr/bin/env bash

# Port-forward the Traefik `web` and `traefik` (dashboard) entrypoints.
# We can find our process later with `ps aux | grep port-forward`.
nohup kubectl port-forward -n traefik svc/traefik 8000:web &>/dev/null &
nohup kubectl port-forward -n traefik svc/traefik 9000:traefik &>/dev/null &

# show the running kubectl port-forward processes
ps aux | grep "[k]ubectl port-forward" | grep traefik
