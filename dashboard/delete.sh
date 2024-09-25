#! /usr/bin/env bash
# Remove dashboard

helm uninstall -n monitoring dashboard
kubectl -n monitoring delete clusterrolebinding/dashboard-kubernetes-dashboard
