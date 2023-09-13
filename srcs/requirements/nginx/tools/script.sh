#!/bin/sh

SSL_PATH=/etc/ssl/
KEY_NAME=${SSL_PATH}/private/nginx.key
CRT_NAME=${SSL_PATH}/certs/nginx.crt

openssl req -newkey rsa:2048 -nodes -x509 -keyout ${KEY_NAME} -out ${CRT_NAME} -days 365 \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=localhost"

chown nginx:nginx ${KEY_NAME} ${CRT_NAME}
chmod 600 ${KEY_NAME} ${CRT_NAME}
