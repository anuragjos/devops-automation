FROM openjdk:8
EXPOSE 8000
ADD target/kubernetes.jar kubernetes.jar
ENTRYPOINT ["java","-jar","/kubernetes.jar"]