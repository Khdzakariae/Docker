#!/bin/bash

WP_CONFIG_SAMPLE="/var/www/wordpress/wp-config-sample.php"

# Replace placeholders with real values in the config file
sed -i "s/database_name_here/${MYSQL_DATABASE}/" "$WP_CONFIG_SAMPLE"
sed -i "s/username_here/${MYSQL_USER}/" "$WP_CONFIG_SAMPLE"
sed -i "s/password_here/${MYSQL_PASSWORD}/" "$WP_CONFIG_SAMPLE"
sed -i "s/localhost/${MYSQL_HOST}/" "$WP_CONFIG_SAMPLE"
