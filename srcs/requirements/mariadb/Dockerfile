FROM debian:bullseye

RUN apt update && \
    apt install -y mariadb-server && \
    apt install -y iproute2

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY ./conf/my.conf /etc/mysql/my.cnf

COPY ./tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["mariadbd"]
