FROM debian:latest

RUN apt-get update && \
    apt-get install -y nginx openssh-server vim sudo && \
    rm -rf /var/lib/apt/lists/*


RUN mkdir -p /var/cache/nginx/client_temp /var/run/nginx /tmp/nginx && \
    chown -R www-data:www-data /var/cache/nginx /var/run/nginx /tmp/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./html/ /var/www/html


EXPOSE 443

CMD ["sudo", "nginx", "-g", "daemon off;"]
