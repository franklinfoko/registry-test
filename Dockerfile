FROM openjdk:17
ENV TZ="Africa/Douala"
COPY target/*.jar /
EXPOSE 8762
ENTRYPOINT ["java", "-jar", "/abc-registry.jar"]

