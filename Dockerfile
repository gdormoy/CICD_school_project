FROM alpine:3.7
ADD ./target/HelloWorld.jar /home/HelloWorld.jar
RUN apk add --no-cache mysql-client
CMD ["java","-jar","/home/HelloWorld.jar"]
