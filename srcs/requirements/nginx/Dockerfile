FROM nginx:1.24.0-alpine

RUN apk add nginx && \
    apk add openssl && \
    apk add openrc

WORKDIR /

COPY ./tools/script.sh /usr/local/bin/nginx_script.sh
RUN chmod +x /usr/local/bin/nginx_script.sh
RUN /usr/local/bin/nginx_script.sh

RUN chmod +rw /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/sites-available/default

CMD [ "/sbin/init" ]

EXPOSE 443
