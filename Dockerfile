FROM openjdk:17
ENV TZ="Africa/Douala"
COPY target/*.jar /
EXPOSE 8762
CMD ["java", "-jar", "/abc-registry.jar"]

