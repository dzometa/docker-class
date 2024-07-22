# Partimos de una base oficial de python
FROM alpine

RUN apk update && apk add nginx 


# Entry point
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]