FROM jboss/keycloak:12.0.1

LABEL org.opencontainers.image.source=https://github.com/m0rgan01/keycloak-sand-box

USER root

COPY themes/todo /opt/jboss/keycloak/themes/todo
RUN chown -R jboss: /opt/jboss/keycloak/themes

USER jboss

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
