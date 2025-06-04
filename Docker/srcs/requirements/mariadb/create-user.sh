#!/bin/bash

CONFIG_FILE="/etc/mysql/mariadb.conf.d/50-server.cnf"

# SQL commands
SQL_COMMANDS="
CREATE DATABASE IF NOT EXISTS $C_DATABASE_NAME;
CREATE USER IF NOT EXISTS '$C_DATABASE_USER_NAME'@'%' IDENTIFIED BY '$C_DATABASE_USER_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$C_DATABASE_USER_NAME'@'%' IDENTIFIED BY '$C_DATABASE_USER_PASS' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SELECT User, Host FROM mysql.user;
"

# Uncomment the port line (or add if not present)
if grep -q "^# *port *= *3306" "$CONFIG_FILE"; then
    sed -i 's/^# *port *= *3306/port = 3306/' "$CONFIG_FILE"
elif ! grep -q "^port *= *3306" "$CONFIG_FILE"; then
    echo "port = 3306" >> "$CONFIG_FILE"
fi

# Run MySQL commands
mysql  -e "$SQL_COMMANDS"
