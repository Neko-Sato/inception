#!/bin/bash
set -e

"$@" --bind-address=localhost &
MARIADB_PID=$! 
until mysqladmin ping --silent; do
  sleep 1
done

mariadb <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
DROP USER IF EXISTS ''@'localhost';
DROP USER IF EXISTS ''@'%';
DROP USER IF EXISTS 'root'@'%';
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
kill $MARIADB_PID
wait $MARIADB_PID

exec "$@"
