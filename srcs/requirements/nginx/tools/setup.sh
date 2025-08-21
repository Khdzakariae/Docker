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

sed -i '/http {/a \
    log_format main '\''$remote_addr - $remote_user [$time_local] "$request" '\'' \
                    '\''$status $body_bytes_sent "$http_referer" '\'' \
                    '\''"$http_user_agent" "$http_x_forwarded_for"'\''; \
    access_log /var/log/nginx/access.log;' /etc/nginx/nginx.conf

# sudo sed -i "s/\$DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/conf.d/nginx.conf
mkdir -p website


