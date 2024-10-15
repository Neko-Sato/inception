FROM debian:latest

RUN apt update && \
    apt install -y mariadb-server

RUN rm -rf /var/lib/mysql

COPY ./conf/my.conf /etc/mysql/my.cnf
COPY ./tools/init.sql /init.sql
COPY ./tools/script.sh /usr/local/bin/script.sh

ENTRYPOINT ["sh", "/usr/local/bin/script.sh"]
