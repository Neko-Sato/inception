#!/bin/bash
set -e

initialize_database() {
  mariadb-install-db
  $@ &
  MARIADB_PID=$! 
  until mysqladmin ping --silent; do
    sleep 1
  done
  sed -e "s/@@@DB_USER@@@/$DB_USER/g" \
      -e "s/@@@DB_PASSWORD@@@/$DB_PASSWORD/g" \
      -e "s/@@@DB_NAME@@@/$DB_NAME/g" \
      init.sql | mariadb
  kill $MARIADB_PID
  wait $MARIADB_PID
}

if [ ! -d /var/lib/mysql/mysql ]; then
  initialize_database $@
fi

exec "$@"
