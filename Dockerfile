# Base image
FROM openjdk

# Add jar to the container
ADD target/docker-spring-boot-0.0.1-SNAPSHOT.jar docker-spring-boot-0.0.1-SNAPSHOT.jar

# Expose application at this port
EXPOSE 8085

# Command to run the jar
ENTRYPOINT ["java", "-jar", "docker-spring-boot-0.0.1-SNAPSHOT.jar"]