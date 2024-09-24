#! /usr/bin/env bash

# Port-forward the Kubernetes dashboard on localhost.
# We can find our process later with `ps aux | grep port-forward`.
nohup kubectl port-forward -n kubernetes-dashboard svc/kubernetes-dashboard 9090:80 &>/dev/null &

# show the running kubectl port-forward process
ps aux | grep "[k]ubectl port-forward" | grep kubernetes-dashboard