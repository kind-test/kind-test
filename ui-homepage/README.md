# Homepage for the `kind` test cluster

This service contains links to the webpages of the clusters' services.  These are registered with the homepage service using the `elasticdt_homepage` database (from the `ds-mysql` service).

- To install this service, execute `init.sh`.
- To remove this service, execute `delete.sh`.
- Refer to the service's `/docs` path to learn how to add/remove services from the homepage registry, using the REST API.

> [!WARNING]
> As the REST API is performs validation, one should not attempt to edit the `elasticdt_homepage` directly even if they have write access to it.

<!-- Currently, we only perform a simple port number range check. More to be added later? -->

