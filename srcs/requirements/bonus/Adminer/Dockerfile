FROM debian:12

RUN apt-get update && apt-get install -y \
    php \
    adminer \
    wget \
    && rm -rf /var/lib/apt/lists/*


EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/usr/share/adminer", "/usr/share/adminer/adminer.php"]