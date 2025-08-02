#!/bin/bash
set -e

apt-get update && apt-get install -y \
    vsftpd \
    sudo \
    ftp \
    passwd \
    curl \
    && rm -rf /var/lib/apt/lists/*

mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

useradd -d /var/www/html/wp-content/uploads -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

mkdir -p /var/www/html/wp-content/uploads

usermod -aG www-data $FTP_USER

exec "$@"
