FROM maven:3.9.6-amazoncorretto-17 AS build

WORKDIR /app
#copy necessary files
COPY src ./src
COPY pom.xml .
# Run the build
RUN mvn clean package -DskipTests

#MultiState build
FROM openjdk:17-jdk-slim
WORKDIR /app
#ARG artifact=target/spring-boot-web.jar
#COPY ${artifact} app.jar
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
# This should not be changed
CMD ["java","-jar","app.jar"]

