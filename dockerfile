FROM openjdk:17-jdk-openjdk
WORKDIR /app
EXPOSE 8080
COPY aws_devops_proj.jar . 
ADD aws_devops_proj.jar /aws_devops_proj.jar
ENTRYPOINT ["java","-jar","/aws_devops_proj.jar"]
USER nobody
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1