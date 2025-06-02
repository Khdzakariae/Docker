#!/bin/bash

WP_CONFIG_SAMPLE="/var/www/wordpress/wp-config-sample.php"
WP_CONFIG="/var/www/wordpress/wp-config.php"

# Replace placeholders with real environment variables
sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" "$WP_CONFIG_SAMPLE"
sed -i "s/username_here/${WORDPRESS_DB_USER}/" "$WP_CONFIG_SAMPLE"
sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" "$WP_CONFIG_SAMPLE"

# Strip port from host if present (e.g., mariadb-container:3306 -> mariadb-container)
DB_HOST=${WORDPRESS_DB_HOST%%:*}
sed -i "s/localhost/${DB_HOST}/" "$WP_CONFIG_SAMPLE"

# Rename the sample config file to wp-config.php
mv "$WP_CONFIG_SAMPLE" "$WP_CONFIG"

