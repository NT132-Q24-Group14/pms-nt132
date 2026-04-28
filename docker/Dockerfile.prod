FROM tomcat:9-jdk21

COPY target/pms.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
