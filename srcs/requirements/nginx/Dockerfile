FROM debian:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=JP/ST=Tokyo/L=Shinjuku/O=42Tokyo/CN=localhost"

COPY ./conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
