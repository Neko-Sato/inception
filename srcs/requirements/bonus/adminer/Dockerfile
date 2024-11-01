FROM debian:bullseye

RUN apt update && \
    apt install -y php-fpm php-mysqlnd && \
    apt install -y iproute2

RUN mkdir -p /run/php/ && \
	chown -R www-data:www-data /run/php/

RUN mkdir -p /var/www/adminer
ADD https://www.adminer.org/latest.php /var/www/adminer/adminer.php

RUN chown -R www-data:www-data /var/www

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm7.4"]
