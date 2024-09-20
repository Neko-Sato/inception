FROM debian:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y nginx

CMD systemctl restart nginx