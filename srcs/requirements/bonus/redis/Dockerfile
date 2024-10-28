FROM debian:latest

RUN apt update && \
    apt install redis-server && \
    apt install -y iproute2

COPY ./conf/redis.conf /etc/redis/redis.conf

COPY ./tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server"]
