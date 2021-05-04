# Task 1
Created a basic spring boot application. `/rest/docker/hello` url to access the application.
### Steps to containerize your application

- Create a [Dockerfile](./Dockerfile).
- Create a docker image using the command  `docker build -f Dockerfile -t docker-spring-boot .` 
- Run the docker image using the command `docker run -p 8085:8085 docker-spring-boot` 

**Note**: Whenever we do some changes in the application first do `mvn clean` then `mvn install` then again build the 
docker image with new updated jar and run the image.
  

