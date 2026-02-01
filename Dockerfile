FROM tomcat:9.0-jdk17-openjdk
# Delete the default Railway/Tomcat files
RUN rm -rf /usr/local/tomcat/webapps/*
# Put YOUR project in the 'ROOT' spot
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]