FROM openjdk:17-jdk-openjdk
EXPOSE 8080
ADD aws_devops_proj.jar aws_devops_proj.jar
ENTRYPOINT ["java","-jar","/aws_devops_proj.jar"]