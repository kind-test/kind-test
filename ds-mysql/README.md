# MySQL Database

Run a MySQL database by executing `init.sh`.  We use the Bitnami **MySQL** and **phpMyAdmin** Helm charts and supply our own values as necessary (see the `values` directory).  Additional resources are specified in the `pre` and `post` Helm charts (Secret, PersistentVolume, PersistentVolumeClaim, HTTPRoute).

### Creating the secret
1. Copy the example secrets file:
   ```bash
   cp secret.example.env secret.env
   ```
   and edit as necessary.

2. Run `create-secret.sh`.  You will get a new `secret.yaml` file in `pre/templates`.

### Running MySQL

Use `init.sh` and `delete.sh` to start and stop the MySQL service and its connected resources.
