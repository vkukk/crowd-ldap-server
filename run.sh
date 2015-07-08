#!/bin/sh
JAR=target/crowd-ldap-server-*.jar

# Apache DS Settings
FIXADS="-Duser.language=en -Duser.country=US"

# Override etc/crowd.properties, e.g. from Docker
if [ -n "${CROWD_APP_NAME+1}" ]; then
  CROWD="-Dapplication.name=$CROWD_APP_NAME $CROWD" 
fi
if [ -n "${CROWD_APP_PW+1}" ]; then
  CROWD="-Dapplication.password=$CROWD_APP_PW $CROWD" 
fi
if [ -n "${CROWD_APP_URL+1}" ]; then
  CROWD="-Dapplication.login.url=$CROWD_APP_URL $CROWD" 
fi
if [ -n "${CROWD_URL+1}" ]; then
  CROWD="-Dcrowd.server.url=$CROWD_URL $CROWD" 
fi
if [ -n "${AD_MEMBEROF+1}" ]; then
  AD="-Demulate.ad.memberof=$AD_MEMBEROF $AD"
fi
if [ -n "${AD_INCLUDE_NESTED+1}" ]; then
  AD="-Demulate.ad.include.nested=$AD_INCLUDE_NESTED $AD"
fi
if [ -n "${LISTENER_PORT+1}" ]; then
  OPTS="-Dlistener.port=$LISTENER_PORT $OPTS"
fi
if [ -n "${SSL_ENABLE+1}" ]; then
  SSL="-Dssl.enabled=$SSL_ENABLE $SSL"
fi
if [ -n "${SSL_KEYSTORE+1}" ]; then
  SSL="-Dssl.keystore=$SSL_KEYSTORE $SSL"
fi
if [ -n "${SSL_PASSWORD+1}" ]; then
  SSL="-Dssl.certificate.password=$SSL_PASSWORD $SSL"
fi
if [[ "${SSL_DEBUG}" == "true" ]]; then
  SSL="-Djavax.net.debug=ssl $SSL"
fi

# Run Server
exec java $OPTS $AD $CROWD $FIXADS $SSL -cp etc -jar $JAR $*

