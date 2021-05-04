FROM openjdk
ADD target/docker-spring-boot-0.0.1-SNAPSHOT.jar docker-spring-boot-0.0.1-SNAPSHOT.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "docker-spring-boot-0.0.1-SNAPSHOT.jar"]