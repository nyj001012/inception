FROM alpine:3.18.3

WORKDIR /

RUN apk add wget \
    php \
    php-mysqli \
    php-fpm \
    php-cgi \
    php-pdo \
    php-gd php-cli \
    php-mbstring

RUN mkdir /var/www/
RUN mkdir /var/www/html/

COPY ./conf/www.conf /var/www/html/

RUN mkdir /run/php


COPY ./tools/script.sh /usr/local/bin/wordpress_script.sh
RUN chmod +x /usr/local/bin/wordpress_script.sh

ENTRYPOINT ["wordpress_script.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
