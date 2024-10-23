FROM debian:latest

RUN apt update && \
    apt install -y php-fpm php-mysqlnd && \
    apt install -y curl  && \
    apt install -y netcat-openbsd

RUN curl -o wordpress.tar.gz -fL https://ja.wordpress.org/latest-ja.tar.gz && \
    mkdir -p /var/www/ && \
    tar -xzf wordpress.tar.gz -C /var/www/ && \
    rm -f wordpress.tar.gz && \
    chown -R www-data:www-data /var/www/wordpress

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php

COPY ./tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_setup.php
RUN chmod +x /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm8.2"]
