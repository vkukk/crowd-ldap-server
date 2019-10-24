FROM maven:3-jdk-8-onbuild
WORKDIR /usr/src/app

# ENV defaults
ENV CROWD_APP_NAME crowd-ldap-server
ENV CROWD_APP_PW crowd-ldap-server
ENV CROWD_APP_URL http://crowd:8095/
ENV CROWD_URL http://crowd:8095/crowd
ENV SSL_ENABLE false
ENV SSL_KEYSTORE /opt/crowd-ldap-server.keystore
ENV SSL_PASSWORD changeit
ENV PORT 10389
ENV AD_MEMBEROF false
ENV AD_INCLUDE_NESTED false
ENV SSL_DEBUG false
EXPOSE $PORT

CMD ["/usr/src/app/run.sh"]
