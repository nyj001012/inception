FROM alpine:3.18.3

RUN apk add nginx && \
    apk add openssl

COPY ./tools/script.sh /usr/local/bin/nginx_script.sh
RUN chmod +x /usr/local/bin/nginx_script.sh
RUN /usr/local/bin/nginx_script.sh

RUN chmod +rw /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]

EXPOSE 443
