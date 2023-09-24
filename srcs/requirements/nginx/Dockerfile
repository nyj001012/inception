FROM alpine:3.18.3

RUN apk update && apk upgrade && \
    apk add nginx openssl

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 --nodes -days 365 \
		      -newkey rsa:2048 \
		      -keyout /etc/nginx/ssl/nginx.key \
		      -out /etc/nginx/ssl/yena.crt \
		      -subj '/C=KR/ST=Seoul/O=42Seoul/OU-42Seoul/CN=yena'

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
