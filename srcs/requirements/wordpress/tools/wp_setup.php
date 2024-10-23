#!/bin/php
<?php

$_SERVER['HTTP_HOST'] = 'localhost';
$_SERVER['SCRIPT_FILENAME'] = basename(__FILE__);

define( 'WP_INSTALLING', true );
require_once '/var/www/wordpress/wp-load.php';
require_once ABSPATH . 'wp-admin/includes/upgrade.php'; 

function maybe_create_user( $name, $email, $password, $role ) {
  $user_id = username_exists( $name );
  if ( !$user_id ) {
    $user_id = wp_create_user(
      $name,
      $password,
      $email,
    );
  }
  $user = new WP_User( $user_id );
  $user->set_role( $role );
  wp_update_user( $user );
}

if ( !is_blog_installed()) {
  wp_install(
    getenv('WP_BLOG_TITLE'),
    getenv('WP_USER1_NAME'),
    getenv('WP_USER1_EMAIL'),
    false,
    '',
    getenv('WP_USER1_PASSWORD'),
    '',
  );
  maybe_create_user(
    getenv('WP_USER2_NAME'),
    getenv('WP_USER2_EMAIL'),
    getenv('WP_USER2_PASSWORD'),
    'subscriber',
  );
}
