FROM debian:latest

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    wget \
    sudo \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    netcat-openbsd \
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
    php-mysql \
    php-redis \
    unzip \
    mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
    
COPY tools/wp-setup.sh /usr/local/bin/wp-setup.sh

RUN chmod +x /usr/local/bin/wp-setup.sh

EXPOSE 9000

CMD ["/usr/local/bin/wp-setup.sh"]