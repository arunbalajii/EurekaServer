FROM openjdk:17-jdk-alpine

#EXPOSE 8081
COPY target/EurekaServer-0.0.1-SNAPSHOT.jar Eureka.jar
ENTRYPOINT ["java","-jar","Eureka.jar"]
