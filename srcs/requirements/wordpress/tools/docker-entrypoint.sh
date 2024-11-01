#!/bin/bash
set -e

wp_exec () {
  (
    cd "/var/www/wordpress"
    gosu www-data wp $@
  )
}

if ! wp_exec core is-installed; then
  wp_exec core install \
    --url="https://$DOMAIN_NAME" \
    --title="$WP_BLOG_TITLE" \
    --admin_user="$WP_USER1_NAME" \
    --admin_password="$WP_USER1_PASSWORD" \
    --admin_email="$WP_USER1_EMAIL"
else
  wp_exec option update home "https://$DOMAIN_NAME"
  wp_exec option update siteurl "https://$DOMAIN_NAME"
fi

if ! wp_exec user get "$WP_USER2_NAME" --field=ID &> /dev/null; then
  wp_exec user create \
    "$WP_USER2_NAME" \
    "$WP_USER2_EMAIL" \
    --user_pass="$WP_USER2_PASSWORD" \
    --role=subscriber
fi

if ! wp_exec plugin is-installed redis-cache; then
  wp_exec plugin install redis-cache
fi

if ! wp_exec plugin is-active redis-cache; then
  wp_exec plugin activate redis-cache
fi

wp_exec redis enable

exec "$@"
