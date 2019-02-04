FROM alpine:3.7
RUN apk add --no-cache mysql-client
erreur
ENTRYPOINT ["mysql"]
