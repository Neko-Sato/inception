FROM debian:bullseye

RUN apt update && \
    apt install -y vsftpd && \
    apt install -y iproute2

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
RUN mkdir -p /var/run/vsftpd/empty

COPY ./tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["vsftpd"]
