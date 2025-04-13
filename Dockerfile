# FROM lolhens/baseimage-openjre
# RUN addgroup -S spring && adduser -S spring -G spring
# USER spring:spring
# ADD target/springbootApp.jar springbootApp.jar
# EXPOSE 80
# ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
# Use a specific version tag to ensure consistent builds
#FROM lolhens/baseimage-openjre
FROM openjdk:17-jdk-alpine


# Create non-root user for security
RUN addgroup -S spring && adduser -S spring -G spring

# Set the non-root user
USER spring:spring

# Replace ADD with COPY as no special features of ADD are needed
COPY target/petclinic.jar springbootApp.jar

# Expose the application port
EXPOSE 80

# Define the entrypoint
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
