#!/bin/bash

# Variables
MYSQL_USER="root"
MYSQL_PASSWORD="your_root_password"

# SQL commands
SQL_COMMANDS="
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'zakariae'@'localhost' IDENTIFIED BY 'password1';
GRANT ALL PRIVILEGES ON *.* TO 'zakariae'@'localhost' IDENTIFIED BY 'password1';
FLUSH PRIVILEGES;
SELECT User, Host FROM mysql.user;
"

# Run MySQL commands
mysql -e "$SQL_COMMANDS"
