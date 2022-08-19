--> Create a sample maven project using below command :- 
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-maven-docker-project -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

In the build section of your pom.xml file remove:

<plugin>
    <artifactId>maven-jar-plugin</artifactId>     
    <version>3.0.2</version>
</plugin>

And replace it with:

<plugin>
    <!-- Build an executable JAR -->
<groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-jar-plugin</artifactId>
          <version>3.1.0</version>
      <configuration>
        <archive>
          <manifest>
                <addClasspath>true</addClasspath>
                <classpathPrefix>lib/</classpathPrefix>
                <mainClass>com.mycompany.app.App</mainClass>
          </manifest>
        </archive>
      </configuration>
</plugin>

Open the pom.xml in the build profile and add a finalname. This finalname will be our jar name.

<build>
  <finalName>my-maven-docker-project</finalName>
</build>

--> Run mvn clean package

Docker commands 
--> docker build -t maven-docker .
--> docker run -p 8080:8080 -d --name maven-container maven-docker
--> docker tag maven-docker:latest kronstonedoc/mavendockernew:latest
--> docker push kronstonedoc/mavendockernew:latest
--> docker container stop container-id :- To stop the running container
--> docker container rm container-id   :- To remove the running container.


Kubernetes commands
--> kubectl apply -f deploy.yaml
--> You should see a pod running with the latest image you just pushed and a service associated with it.
--> Type of the service you will see is ClusterIP
--> Portforward the service to see the results on the localhost 

--> kubectl port-forward service/maven-docker 8080:8080