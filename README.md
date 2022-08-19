# Setup commands 

- Run mvn clean package

## Docker commands 

- docker build -t maven-docker .
- docker run -p 8080:8080 -d --name maven-container maven-docker
- docker tag maven-docker:latest kronstonedoc/mavendockernew:latest
- docker push kronstonedoc/mavendockernew:latest
- docker container stop container-id :- To stop the running container
- docker container rm container-id   :- To remove the running container.


## Kubernetes commands
- kubectl apply -f deploy.yaml
- You should see a pod running with the latest image you just pushed and a service associated with it.
- Type of the service you will see is ClusterIP
- Portforward the service to see the results on the localhost 
- kubectl port-forward service/maven-docker 8080:8080