FROM debian:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y php-fpm && \
    apt install -y curl

WORKDIR /var/www/html

RUN curl -fsOL https://ja.wordpress.org/latest-ja.tar.gz && \
    tar xvf latest-ja.tar.gz && \
    rm -f latest-ja.tar.gz && \
    chown -R www-data:www-data .

ENTRYPOINT [ "" ]