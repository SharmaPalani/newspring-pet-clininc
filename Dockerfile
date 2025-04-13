# # FROM lolhens/baseimage-openjre
# # RUN addgroup -S spring && adduser -S spring -G spring
# # USER spring:spring
# # ADD target/springbootApp.jar springbootApp.jar
# # EXPOSE 80
# # ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
# # Use a specific version tag to ensure consistent builds
# #FROM lolhens/baseimage-openjre
# FROM openjdk:17-jdk-alpine


# # Create non-root user for security
# RUN addgroup -S spring && adduser -S spring -G spring

# # Set the non-root user
# USER spring:spring

# # Replace ADD with COPY as no special features of ADD are needed
# COPY target/petclinic.jar springbootApp.jar

# # Expose the application port
# EXPOSE 80

# # Define the entrypoint
# ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
# Use Jetty 11 image with Java 17 support (compatible with Jakarta EE)
FROM jetty:11-jdk17

# Set environment variable (optional, for clarity)
ENV WAR_FILE petclinic.war

# Copy your WAR file into Jetty’s webapps directory
COPY target/${WAR_FILE} /var/lib/jetty/webapps/ROOT.war

# Expose Jetty’s default port
EXPOSE 8080

# Jetty auto-deploys WAR on startup — no CMD/ENTRYPOINT needed
