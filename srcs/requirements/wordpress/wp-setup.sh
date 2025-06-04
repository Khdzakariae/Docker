#!/bin/bash

sed -i 's|^listen = .*|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf
mkdir -p /var/www/wordpress

curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /var/www
rm /tmp/wordpress.tar.gz
chown -R www-data:www-data /var/www/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "Waiting for MariaDB to be ready..."
until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
  sleep 2
done

WP_PATH="/var/www/wordpress"
WP_CONFIG_SAMPLE="$WP_PATH/wp-config-sample.php"
WP_CONFIG="$WP_PATH/wp-config.php"
cp "$WP_CONFIG_SAMPLE" "$WP_CONFIG"
sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" "$WP_CONFIG"
sed -i "s/username_here/${WORDPRESS_DB_USER}/" "$WP_CONFIG"
sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/" "$WP_CONFIG"
DB_HOST=${WORDPRESS_DB_HOST%%:*}
sed -i "s/localhost/${DB_HOST}/" "$WP_CONFIG"

echo "
if (isset(\$_SERVER['HTTP_X_FORWARDED_PROTO']) && \$_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    \$_SERVER['HTTPS'] = 'on';
}
" >> "$WP_CONFIG"

wp core install \
  --path="$WP_PATH" \
  --url="https://localhost" \
  --title="inception" \
  --admin_user="admin" \
  --admin_password="admin123" \
  --admin_email="admin@admin.com" \
  --skip-email \
  --allow-root
