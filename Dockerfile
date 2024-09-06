FROM openjdk:17-oracle

EXPOSE 8080

COPY ./build/libs/gateway-0.0.1-SNAPSHOT.jar /app/gateway.jar
WORKDIR /app

CMD ["java", "-Xmx4g", "-jar", "gateway.jar"]