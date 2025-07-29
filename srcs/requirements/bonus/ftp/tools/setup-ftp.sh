#!/bin/bash
set -e

apt-get update && apt-get install -y \
    vsftpd \
    sudo \
    ftp \
    curl \
    && rm -rf /var/lib/apt/lists/*


mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

useradd -d /var/www/html/wp-content/uploads -s /bin/bash ftpuser
echo "ftpuser:ftppassword" | chpasswd


mkdir -p /var/www/html/wp-content/uploads

usermod -aG www-data ftpuser

