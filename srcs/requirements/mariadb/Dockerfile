FROM alpine:3.18.3

WORKDIR /

RUN apk add mariadb-client && \
    mkdir -p /var/run/mysqld && \
    chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./tools/script.sh /usr/local/bin/mariadb_script.sh
COPY ./conf/db_test.sql /docker-entrypoint-initdb.d/init.sql

RUN chmod +x /usr/local/bin/mariadb_script.sh

ENTRYPOINT ["/bin/sh", "-c", "mariadb_script.sh && mysqld --bind-address=0.0.0.0"]
