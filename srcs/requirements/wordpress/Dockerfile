FROM debian:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php php-fpm php-mysql php-curl php-xml php-mbstring php-cli php-zip unzip curl mariadb-client && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz && \
    rm wordpress.tar.gz && \
    mv wordpress /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
