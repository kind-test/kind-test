# MySQL Database

Run a MySQL database by executing `init.sh`.  We use the Bitnami MySQL Helm chart and supply our own `values.yaml`.  Additional Kubernetes resources are installed using the `extraDeploy` field in the third-party Helm chart, which the resource definitions placed in the `extraDeploy` directory.

### Creating the secret
1. Copy the example secrets file:
   ```bash
   cp secret.example.env secret.env
   ```
   and edit as necessary.

2. Run `create-secret.sh`.  You will get a new `secret.yaml` file in `pre/templates`.
