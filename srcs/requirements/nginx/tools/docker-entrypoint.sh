#!/bin/bash
set -e

mkdir -p /etc/nginx/ssl

openssl genpkey \
    -algorithm EC \
    -pkeyopt ec_paramgen_curve:prime256v1 \
    -out /etc/nginx/ssl/nginx.key

openssl req -x509 \
    -key /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -days 365 \
    -subj "/C=JP/ST=Tokyo/L=Shinjuku/O=42Tokyo/CN=$DOMAIN_NAME"

exec "$@"
