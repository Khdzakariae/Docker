FROM debian:latest

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/setup-ftp.sh /setup-ftp.sh

RUN /bin/bash -ex /setup-ftp.sh

EXPOSE 20 21 21000-21010

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]