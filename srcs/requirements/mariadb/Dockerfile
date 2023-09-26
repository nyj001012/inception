FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/run/mysqld; \
    chmod 777 /var/run/mysqld;

RUN sed -i "s|skip-networking|#skip-networking|g" \
    /etc/my.cnf.d/mariadb-server.cnf

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

EXPOSE 3306

COPY ./tools/script.sh /

ENTRYPOINT ["sh", "script.sh"]

CMD ["mariadbd","--user=mysql", "--bind-address=0.0.0.0"]
