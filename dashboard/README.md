# Kubernetes dashboard

This directory contains files and scripts for the Kubernetes dashboard.

Scripts:
- `init.sh`: Launchs the dashboard using `helm install`, creates a clusterrolebinding and
  login token, and registers the dashboard with the `ui-homepage` service.
- `portforward.sh`: Forwards the port for the Kubernetes dashboard.
- `delete.sh`: unregisters the dashboard from the `ui-homepage` service and uninstalls all
  associated Kubernetes/Helm objects.