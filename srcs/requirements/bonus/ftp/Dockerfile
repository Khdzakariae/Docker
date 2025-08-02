FROM debian:latest

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/setup-ftp.sh /setup-ftp.sh

RUN chmod +x /setup-ftp.sh

EXPOSE 20 21 21000-21010

ENTRYPOINT ["/setup-ftp.sh"]
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]