FROM openjdk:17-jdk-slim
WORKDIR /app
ARG artifact=target/spring-boot-web.jar
COPY ${artifact} app.jar

# This should not be changed
ENTRYPOINT ["java","-jar","app.jar"]

