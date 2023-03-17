FROM openjdk:8
COPY . .
EXPOSE 8080
RUN mvn install
CMD ["java","-jar","kubernetes.jar"]