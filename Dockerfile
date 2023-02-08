FROM openjdk:8
EXPOSE 8080
ADD target/kubernets kubernetes.jar
ENTRYPOINT [ "java","-jar", "/kubernetes-jar" ]
