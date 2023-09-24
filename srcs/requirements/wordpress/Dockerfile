FROM alpine:3.18.3

RUN apk update && apk upgrade && apk add --no-cache \
    php8.2-cli \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-json \
    php8.2-curl \
    mariadb-client sendmail && \
    sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

COPY ./tools/script.sh /

ENTRYPOINT ["sh", "script.sh"]

CMD ["php-fpm8.2", "-F"]
