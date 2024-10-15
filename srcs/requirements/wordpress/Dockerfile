FROM debian:latest

RUN apt update && \
    apt install -y php-fpm php-mysqlnd && \
    apt install -y curl

RUN rm -rf /var/www/html

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /wp-config.php
COPY ./tools/script.sh /usr/local/bin/script.sh

ENTRYPOINT [ "sh", "/usr/local/bin/script.sh" ]
