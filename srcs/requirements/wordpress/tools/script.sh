set -e

if [ ! -d /var/www/html ]; then
    curl -fsOL https://ja.wordpress.org/latest-ja.tar.gz
    tar -zxvf latest-ja.tar.gz
    rm -f latest-ja.tar.gz
    mv wordpress /var/www/html
    mv wp-config.php /var/www/html/
    chown -R www-data:www-data /var/www/html
fi

exec php-fpm8.2 -F
