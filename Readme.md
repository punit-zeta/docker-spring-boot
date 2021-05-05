# Task 1
Created a basic spring boot application. `/rest/docker/hello` url to access the application.
### Containerize application

- Create a [Dockerfile](./Dockerfile).
- Create a docker image using the command  
    ~~~
    docker build -f Dockerfile -t docker-spring-boot .
    ~~~
- Run the docker image using the command 
    ~~~
    docker run -p 8085:8085 docker-spring-boot
    ~~~

**Note**: Whenever we do some changes in the application first do `mvn clean install` then again build the 
docker image with new updated jar and run the image.
  
# Push Docker Image
Create a new repo on docker hub. You may need to run `docker login` first.
- Tag your image using:
docker tag `local-image-name`:`local-image-tag` `repo-path`:`repo-tag`
    ~~~
    docker tag docker-spring-boot:latest punitzeta/new-repo:latest
    ~~~
- Push the image using:
docker push `repo-path`:`repo-tag`
    ~~~
    docker push punitzeta/new-repo:latest
    ~~~

# Helm Deploy

- Create your helm chart using:
helm create `helmchart-name`
    ~~~
    helm create springboot
    ~~~

- See the structure of your helm chart using:
tree `helmchart-name`
    ~~~
    tree spingboot
    ~~~
- Compile your helm to see in errors using: helm lint `helmchart-name/`
    ~~~
    helm lint springboot/
    ~~~
- Install helm chart 
    ~~~
    helm install springb-release --debug --dry-run `springboot`
    helm install spring-release springboot
    ~~~
  The above commands will generate 3 commands in the result which needs to be executed for running your application in your
  browser.
- List all charts
    ~~~
    helm list -a
    ~~~
- Upgrade helm chart using   
helm upgrade `release-name` `helmchart-name`
    ~~~
    helm upgrade spring-release springboot
    ~~~

# Run service in browser
This commands will be auto generate when you install your helm chart. You must use that commands. The commands
given below are for reference only.
- Get pod name
    ~~~
    export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=springboot,app.kubernetes.io/instance=spring-realease" -o jsonpath="{.items[0].metadata.name}")
    ~~~

- Get container port 
    ~~~
    export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
    ~~~
 
- Run this command for port forwarding
    ~~~
    kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
    ~~~

Now you can access the application at [http://127.0.0.1:8080](http://127.0.0.1:8080)

# Other useful commands 
- kubectl get pods
- kubectl get all
- kubectl get deployments