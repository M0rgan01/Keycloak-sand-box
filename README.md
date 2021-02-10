# Keycloak-sand-box

This project allows editing of the keycloak theme for the Todo application

## Commands for local development

### Build and run containers

```bash
docker-compose up -d
```
And go to the Traefik keycloak routers mentioned host

### Stop containers

```bash
docker-compose stop
```

### Override themes

```bash
docker exec rm_tool_keycloak rm -rf /opt/jboss/keycloak/themes/todo
docker cp ./themes/rmtool rm_tool_keycloak:/opt/jboss/keycloak/themes/todo
```

### Disable front caching

[disable-theme-cache.cli](./disable-theme-cache.cli) actually disable front caching 
at container startup (see docker-compose for more information)

or

```bash
docker cp ./imports/standalone.xml rm_tool_keycloak:/opt/jboss/keycloak/standalone/configuration/standalone.xml
```