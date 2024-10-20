FROM debian:latest

RUN apt update && \
    apt install -y nginx && \
    apt install -y openssl

RUN rm -rf /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/script.sh script.sh

ENTRYPOINT ["sh", "script.sh"]
