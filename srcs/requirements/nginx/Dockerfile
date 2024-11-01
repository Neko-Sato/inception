FROM debian:bullseye

RUN apt update && \
    apt install -y nginx && \
    apt install -y openssl && \
    apt install -y iproute2

RUN chown -R www-data:www-data /var/www

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
