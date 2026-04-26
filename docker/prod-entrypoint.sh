#!/bin/bash
envsubst < /app/src/main/resources/db.properties.example > /opt/tomcat/webapps/pms/WEB-INF/classes/db.properties

exec /opt/tomcat/bin/catalina.sh run
