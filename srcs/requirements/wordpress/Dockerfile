FROM debian:bullseye

RUN apt-get update && apt-get install -y wget

RUN apt-get install apt-transport-https lsb-release ca-certificates wget -y && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
    apt-get update

RUN apt-get update && apt-get install -y \
    php8.2-cli \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-curl curl \
    php-json \
    mariadb-client && \
    sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /run/php && chmod +wr /run/php

EXPOSE 9000

COPY ./tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["sh", "script.sh"]

CMD ["php-fpm8.2", "-F", "-R"]
