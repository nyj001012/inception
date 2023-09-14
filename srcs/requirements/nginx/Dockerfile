FROM alpine:3.18.3

RUN apk update && apk upgrade && \
    apk add nginx && \
    apk add openssl && \
    apk add openrc

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
