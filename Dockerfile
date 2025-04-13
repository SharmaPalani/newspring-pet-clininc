FROM lolhens/baseimage-openjre
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ADD target/springbootApp.jar springbootApp.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]