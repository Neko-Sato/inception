set -e

if [ ! -d /var/lib/mysql ]; then
    mariadb-install-db --user=mysql
    mariadb << EOF
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
SELECT 'Hello, World!' AS message;
EOF
fi

mariadbd-safe --bind-address=0.0.0.0
