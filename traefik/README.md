# Traefik Helm setup

This directory contains files and scripts for the Traefik service.

We use the public Helm chart at <https://traefik.github.io/charts/>, supplying our own `values.yaml` file for chart configuration.


### Scripts:
- `.init.sh`: Sets up Traefik using the [Kubernetes Gateway API](https://traefik.io/blog/getting-started-with-kubernetes-gateway-api-and-traefik/) method.
- `portforward.sh`: Forwards the ports for the `web` and `dashboard` entrypoints.
