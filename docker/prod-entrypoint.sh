#!/bin/bash
envsubst < /usr/local/tomcat/db.properties.template > /usr/local/tomcat/webapps/pms/WEB-INF/classes/db.properties

exec catalina.sh run
