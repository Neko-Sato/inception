#!/bin/bash
set -e

WP_PATH=/var/www/wordpress

gosu www-data sh <<EOF
wp db check --path="$WP_PATH"
wp core update-db --path="$WP_PATH"

if ! wp user get "$WP_USER1_NAME" --field=ID > /dev/null 2>&1; then
	wp user create "$WP_USER1_NAME" "$WP_USER1_EMAIL" --user_pass="$WP_USER1_PASSWORD" --role=administrator
fi

if ! wp user get "$WP_USER2_NAME" --field=ID > /dev/null 2>&1; then
	wp user create "$WP_USER2_NAME" "$WP_USER2_EMAIL" --user_pass="$WP_USER2_PASSWORD" --role=subscriber
fi

wp option update blogname "$WP_BLOG_TITLE"
wp option update admin_email "$WP_USER1_EMAIL"
wp option update blog_public false
wp option update siteurl "https://$DOMAIN_NAME"
EOF

exec "$@" -F
