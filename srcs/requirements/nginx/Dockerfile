FROM debian:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y nginx && \
    apt install -y openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/script.sh /usr/local/bin/script.sh

ENTRYPOINT ["sh", "/usr/local/bin/script.sh"]
