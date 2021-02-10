FROM jboss/keycloak:12.0.1

USER root

COPY themes/todo /opt/jboss/keycloak/themes/todo
RUN chown -R jboss: /opt/jboss/keycloak/themes

USER jboss

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
