FROM jboss/keycloak:12.0.1

LABEL org.opencontainers.image.source=https://github.com/m0rgan01/keycloak-sand-box

USER root
# import keycloak global config
COPY imports/realm/realm-export.json /opt/jboss/keycloak/imports/realm-export.json
# import custom theme
COPY themes/todo /opt/jboss/keycloak/themes/todo
# add permissions for themes
RUN chown -R jboss: /opt/jboss/keycloak/themes

USER jboss

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
# this options is required for import keycloak congig
CMD ["-Dkeycloak.profile.feature.upload_scripts=enabled"]
