if [ ! -d /var/www/html ]; then
    mkdir -p /var/www/html
    chown -R www-data:www-data /var/www/html
    (
        cd /var/www/html
        curl -fsOL https://ja.wordpress.org/latest-ja.tar.gz
        tar -zxvf latest-ja.tar.gz
        cp -r wordpress/* /var/www/html
        rm -rf latest-ja.tar.gz wordpress
    )
fi

exec php-fpm8.2 -F
