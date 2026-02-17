# Stage 1: Build the app using a maintained Java image
FROM eclipse-temurin:11-jdk AS builder
WORKDIR /app
COPY . .

# Create lib folder and download necessary dependencies
RUN mkdir -p WEB-INF/lib
ADD https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar WEB-INF/lib/
ADD https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.28/mysql-connector-java-8.0.28.jar WEB-INF/lib/

# Compile your code
RUN mkdir -p WEB-INF/classes
RUN find src -name "*.java" > sources.txt
RUN javac -d WEB-INF/classes -cp "WEB-INF/lib/*" @sources.txt
RUN jar -cvf ROOT.war *

# Stage 2: Run the app in Tomcat
FROM tomcat:9.0-jdk11-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/ROOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]