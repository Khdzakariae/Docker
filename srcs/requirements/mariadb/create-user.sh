#!/bin/bash

DB_ROOT_PASSWORD="2001"
NEW_DB="wordpress"
NEW_USER="wp_user"
NEW_PASS="wp_pass"

until mysqladmin ping -h "localhost" --silent; do
  echo "Waiting for database connection..."
  sleep 2
done

mysql -uroot -p"$DB_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`$NEW_DB\`;
    CREATE USER IF NOT EXISTS '$NEW_USER'@'%' IDENTIFIED BY '$NEW_PASS';
    GRANT ALL PRIVILEGES ON \`$NEW_DB\`.* TO '$NEW_USER'@'%';
    FLUSH PRIVILEGES;
EOSQL

echo "User '$NEW_USER' with access to database '$NEW_DB' created."

