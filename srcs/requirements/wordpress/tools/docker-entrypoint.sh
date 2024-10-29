#!/bin/bash
set -e

wp_exec () {
  (
    cd "/var/www/wordpress"
    wp --allow-root $@
  )
}

if ! wp_exec core is-installed; then
  wp_exec core install \
    --url="https://$DOMAIN_NAME" \
    --title="$WP_BLOG_TITLE" \
    --admin_user="$WP_USER1_NAME" \
    --admin_password="$WP_USER1_PASSWORD" \
    --admin_email="$WP_USER1_EMAIL"
fi

if ! wp_exec user get "$WP_USER2_NAME" --field=ID > /dev/null 2>&1; then
  wp_exec user create \
    "$WP_USER2_NAME" \
    "$WP_USER2_EMAIL" \
    --user_pass="$WP_USER2_PASSWORD" \
    --role=subscriber
fi

exec "$@" -F
