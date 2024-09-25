#! /usr/bin/env bash

# Port-forward the Kubernetes dashboard on localhost.
# We can find our process later with `ps aux | grep port-forward`.
nohup kubectl port-forward -n monitoring svc/dashboard-kong-proxy 8443:443 &>/dev/null &

# show the running kubectl port-forward process
ps aux | grep "[k]ubectl port-forward" | grep dashboard-kong-proxy