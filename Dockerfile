FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
ARG artifact=target/spring-boot-web.jar
COPY ${artifact} app.jar

# This should not be changed
ENTRYPOINT ["java","-jar","app.jar"]

