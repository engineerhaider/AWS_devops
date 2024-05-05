# Use an official OpenJDK runtime as a parent image
FROM openjdk:17

# Set the working directory in the container
WORKDIR /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Copy the JAR file into the container at /app (WORKDIR)
COPY aws_devops_proj.jar /app/aws_devops_proj.jar

# Specify the command to run the jar file
ENTRYPOINT ["java", "-jar", "/app/aws_devops_proj.jar"]

# Run the application as a non-root user for security
USER nobody

# Optional: Add a health check (make sure curl is installed if you use this)
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
CMD curl -f http://localhost:8080/health || exit 1