#!/bin/bash

wp core install --url="yourdomain.com" --title="Inception" \
    --admin_user="inceptionadmin" --admin_password="securepass" --admin_email="admin@example.com" --path="/var/www/wordpress" --allow-root

# Create second user
wp user create user2 user2@example.com --user_pass="pass123" --role=subscriber --allow-root

