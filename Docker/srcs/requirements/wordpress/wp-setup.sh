#!/bin/bash

sed -i 's|^listen = .*|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

mkdir -p /var/www/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www && \
    rm /tmp/wordpress.tar.gz

chown -R www-data:www-data /var/www/wordpress

WP_PATH="/var/www/wordpress"
WP_CONFIG_SAMPLE="$WP_PATH/wp-config-sample.php"
WP_CONFIG="$WP_PATH/wp-config.php"

sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" "$WP_CONFIG_SAMPLE"
sed -i "s/username_here/${WORDPRESS_DB_USER}/" "$WP_CONFIG_SAMPLE"
sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" "$WP_CONFIG_SAMPLE"

DB_HOST=${WORDPRESS_DB_HOST%%:*}
sed -i "s/localhost/${DB_HOST}/" "$WP_CONFIG_SAMPLE"

mv "$WP_CONFIG_SAMPLE" "$WP_CONFIG"

WP_PATH="/var/www/wordpress"

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

wp core install \
  --path="/var/www/wordpress" \
  --url="http://localhost:8080" \
  --title="inception" \
  --admin_user="admin" \
  --admin_password="admin123" \
  --admin_email="admin@admin.com" \
  --skip-email \
  --allow-root
