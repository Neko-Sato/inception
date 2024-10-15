set -e

initialize_database() {
    mysql_install_db --user=mysql
    mariadbd-safe &
    MARIADB_PID=$!
    sleep 1
    mariadb < /init.sql
    kill $MARIADB_PID
    wait $MARIADB_PID
}

if [ ! -d /var/lib/mysql/mysql ]; then
  initialize_database
fi

exec mariadbd-safe