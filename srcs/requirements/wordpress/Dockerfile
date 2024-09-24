FROM debian:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y php-fpm php-mysqlnd && \
    apt install -y curl

RUN mkdir -p /var/www/html && \ 
    chown -R www-data:www-data /var/www/html && \
    curl -fsOL https://ja.wordpress.org/latest-ja.tar.gz && \
    tar -zxvf latest-ja.tar.gz && \
    cp -r wordpress/* /var/www/html && \
    rm -rf latest-ja.tar.gz wordpress

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

ENTRYPOINT [ "php-fpm8.2", "-F" ]
