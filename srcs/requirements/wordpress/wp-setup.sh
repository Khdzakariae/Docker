#!/bin/bash

WP_PATH="/var/www/wordpress"
WP_CONFIG_SAMPLE="$WP_PATH/wp-config-sample.php"
WP_CONFIG="$WP_PATH/wp-config.php"

# Replace placeholders with real environment variables
sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" "$WP_CONFIG_SAMPLE"
sed -i "s/username_here/${WORDPRESS_DB_USER}/" "$WP_CONFIG_SAMPLE"
sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" "$WP_CONFIG_SAMPLE"

# Strip port from host if present (e.g., mariadb-container:3306 -> mariadb-container)
DB_HOST=${WORDPRESS_DB_HOST%%:*}
sed -i "s/localhost/${DB_HOST}/" "$WP_CONFIG_SAMPLE"

# Rename the sample config file to wp-config.php
mv "$WP_CONFIG_SAMPLE" "$WP_CONFIG"

# Wait until WordPress is ready
until curl -s http://localhost | grep -q "WordPress"; do
  echo "Waiting for WordPress to be ready..."
  sleep 5
done

# Install WordPress using WP-CLI
WP_PATH="/var/www/wordpress"

# Install WordPress using WP-CLI
# wp core install \
#   --path="$WP_PATH" \
#   --url="http://localhost:8080" \
#   --title="inception" \
#   --admin_user="admin" \
#   --admin_password="admin123" \
#   --admin_email="admin@admin.com" \
#   --skip-email

# # Optional: discourage search engines from indexing
# wp option update blog_public 0 --path="$WP_PATH"