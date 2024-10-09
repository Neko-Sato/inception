FROM debian:latest

RUN apt update && \
    apt install -y mariadb-server

RUN rm -rf /var/lib/mysql

COPY ./tools/script.sh /usr/local/bin/script.sh

ENTRYPOINT ["sh", "/usr/local/bin/script.sh"]
