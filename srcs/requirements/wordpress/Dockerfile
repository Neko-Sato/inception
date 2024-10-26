FROM debian:latest

RUN apt update && \
    apt install -y php php-fpm php-mysqlnd && \
    apt install -y gosu && \
    apt install -y iproute2

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress && \
	wp core download --allow-root --locale=ja --path=/var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php

COPY ./tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm8.2"]
