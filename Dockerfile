FROM openjdk:8
WORKDIR /app
COPY . .
#RUN mvn install
EXPOSE 8081
CMD ["java","-jar","kubernetes.jar"]

