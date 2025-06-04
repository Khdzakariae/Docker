FROM debian:latest

RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    gnupg \
    curl && \
    curl -sSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/php.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-curl \
    php8.2-xml \
    php8.2-mbstring \
    php8.2-cli \
    php8.2-zip \
    unzip \
    mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY wp-setup.sh /usr/local/bin/wp-setup.sh

RUN chmod +x /usr/local/bin/wp-setup.sh

WORKDIR /var/www/wordpress

EXPOSE 9000

CMD ["/bin/bash", "-c", "/usr/local/bin/wp-setup.sh && php-fpm8.2 -F"]