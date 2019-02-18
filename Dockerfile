FROM alpine:3.7
WORKDIR /
ADD /var/lib/jenkins/workspace/CICD_school_project_master/target/HelloWord.jar /home/HelloWorld.jar
RUN apk add --no-cache mysql-client
CMD ["java","-jar","/home/HelloWorld.jar"]
