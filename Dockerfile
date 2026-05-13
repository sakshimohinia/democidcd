FROM eclipse-temurin:17-jdk
COPY target/spring-boot-rest-api-tutorial-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]