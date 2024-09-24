FROM debian:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y mariadb-server

ENTRYPOINT ["mariadbd-safe", "--bind-address=0.0.0.0"]
