FROM debian:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y nginx penssl

RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -days 365 -nodes -subj "/CN=localhost"


CMD systemctl restart nginx