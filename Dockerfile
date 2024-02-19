FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src /src
RUN mvn clean package -DskipTests
ENTRYPOINT ["java","-jar","target/sampleapp-1.0-SNAPSHOT.jar"]
FROM tomcat
COPY target/hello-1.0.war /usr/local/tomcat/webapps/
