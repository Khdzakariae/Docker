FROM debian:latest

RUN apt-get update && \
    apt-get install -y nginx openssh-server vim sudo openssl php8.2-fpm && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/cache/nginx/client_temp /var/run/nginx /tmp/nginx /etc/nginx/ssl && \
    chown -R www-data:www-data /var/cache/nginx /var/run/nginx /tmp/nginx /etc/nginx/ssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./html/ /var/www/html

COPY generate-ssl.sh /usr/local/bin/generate-ssl.sh
RUN chmod +x /usr/local/bin/generate-ssl.sh
RUN /usr/local/bin/generate-ssl.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]