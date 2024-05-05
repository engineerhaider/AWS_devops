# Use an official OpenJDK runtime as a parent image
FROM openjdk:17

# Set the working directory in the container
WORKDIR /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Ensure the relative path here is correct
COPY ./SPRINGBOOT-K8S-EXAMPLE-MAIN/aws-devops-proj.jar /System/Volumes/Data/Users/haidershaghati/Desktop/TechConsulting/Projects/task_01/springboot-k8s-example-main/app/aws-devops-proj.jar

# Set permissions if necessary (uncomment if you want to ensure executable permissions)
# RUN chmod 755 /app/aws_devops_proj.jar

# Specify the command to run the jar file
ENTRYPOINT ["java", "-jar", "/app/aws-devops-proj.jar"]

# Run the application as a non-root user for security
USER nobody

# Optional: Add a health check (make sure curl is installed if you use this)
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
CMD curl -f http://localhost:8080/health || exit 1