FROM openjdk:8
WORKDIR /app
ADD target/my-maven-docker-project.jar /app
ENTRYPOINT ["sh","-c"]
CMD ["java -jar my-maven-docker-project.jar"]
EXPOSE 8080