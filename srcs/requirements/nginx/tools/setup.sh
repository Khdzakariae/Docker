#!/bin/bash
set -e

apt-get update && \
apt-get install -y nginx openssh-server vim sudo openssl php8.2-fpm && \
rm -rf /var/lib/apt/lists/*

mkdir -p /var/cache/nginx/client_temp /var/run/nginx /tmp/nginx /etc/nginx/ssl
chown -R www-data:www-data /var/cache/nginx /var/run/nginx /tmp/nginx /etc/nginx/ssl

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/privkey.pem \
  -out /etc/nginx/ssl/cert.pem \
  -subj "/C=MA/L=BNG/O=1337/CN=zel-khad.42.fr"

mkdir -p website
