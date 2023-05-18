# Keycloak-sand-box

This project allows editing of the keycloak theme for the Todo application

## Commands for local development

### Build and run containers

```bash
docker compose up -d
```

### Stop containers

```bash
docker compose stop
```

### Override themes

```bash
docker exec todo_keycloak rm -rf /opt/keycloak/themes/todo
docker cp ./themes/todo todo_keycloak:/opt/keycloak/themes/todo
```

### Disable front caching

[disable-theme-cache.cli](./disable-theme-cache.cli) actually disable front caching 
at container startup (see docker-compose for more information)

or

```bash
docker cp ./imports/standalone.xml todo_keycloak:/opt/keycloak/standalone/configuration/standalone.xml
```