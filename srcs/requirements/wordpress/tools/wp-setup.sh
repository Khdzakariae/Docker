#!/bin/bash

mkdir -p /var/www/wordpress

cd /var/www/wordpress

wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

cp wp-config-sample.php wp-config.php

sudo sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config.php 
sudo sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config.php 
sudo sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config.php 
sudo sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb-container:3306' );/g" wp-config.php 


echo "Waiting for MariaDB to be ready..."
until mysqladmin ping -h"mariadb-container" --silent; do
  sleep 2
done

wp core install \
  --path="/var/www/wordpress" \
  --url="https://localhost" \
  --title="inception" \
  --admin_user=$ADMIN_USER \
  --admin_password=$ADMIN_PASSWORD \
  --admin_email=$ADMIN_EMAIL \
  --skip-email \
  --allow-root

wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role='subscriber' --user_pass=$WORDPRESS_PASSWORD --allow-root

sudo chown -R www-data:www-data /var/www/wordpress
sudo chmod -R 755 /var/www/wordpress

sudo sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

php-fpm8.2 -F
