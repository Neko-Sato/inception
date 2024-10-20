FROM debian:latest

RUN apt update && \
    apt install -y mariadb-server

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY ./conf/my.conf /etc/mysql/my.cnf

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mariadbd"]
