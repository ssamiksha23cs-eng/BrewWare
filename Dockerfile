# Use Tomcat 9 with JDK 11
FROM tomcat:9.0-jdk11-openjdk

# Delete existing default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your ROOT.war into Tomcat's deployment folder
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]