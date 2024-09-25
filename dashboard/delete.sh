#! /usr/bin/env bash
# Remove dashboard

helm uninstall -n monitoring dashboard
kubectl -n monitoring delete clusterrolebinding/dashboard-kubernetes-dashboard

ps aux | grep "[k]ubectl port-forward" | grep "svc/dashboard-kong-proxy" | awk '{print $2}' | xargs -n1 kill