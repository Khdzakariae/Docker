FROM debian:latest

# Install vsftpd and basic tools
RUN apt-get update && apt-get install -y \
    vsftpd \
    ftp \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy default config (you can customize later)
RUN mkdir -p /var/run/vsftpd/empty && \
    chmod 755 /var/run/vsftpd/empty

COPY conf/vsftpd.conf /etc/vsftpd.conf

# Create ftp user with home as WordPress subfolder
RUN useradd -d /var/www/wordpress/wp-content/uploads -s /bin/bash ftpuser \
    && echo "ftpuser:ftppassword" | chpasswd

RUN usermod -aG www-data ftpuser

# Ensure folder exists and has proper permissions
RUN mkdir -p /var/www/wordpress/wp-content/uploads \
    && chown -R ftpuser:ftpuser /var/www/wordpress/wp-content/uploads

# Expose FTP ports
EXPOSE 20 21 21000-21010

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
