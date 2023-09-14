#!/bin/sh

CERTS=/etc/ssl/certs/nginx.crt
KEYS=/etc/ssl/private/nginx.key

openssl req -newkey rsa:2048 -nodes -x509 -keyout ${KEYS} -out ${CERTS} -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=yena.42.fr"
