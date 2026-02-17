# Stage 1: Build the application
FROM openjdk:11-jdk-slim AS builder

WORKDIR /app
COPY . .

# Download the Servlet API and MySQL Connector for compilation
ADD https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar WEB-INF/lib/
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar WEB-INF/lib/

# Compile the Java files
RUN mkdir -p WEB-INF/classes
RUN find src -name "*.java" > sources.txt
RUN javac -d WEB-INF/classes -cp "WEB-INF/lib/*" @sources.txt

# Create the WAR file inside the container
RUN jar -cvf ROOT.war *

# Stage 2: Run the application in Tomcat
FROM tomcat:9.0-jdk11-openjdk
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]