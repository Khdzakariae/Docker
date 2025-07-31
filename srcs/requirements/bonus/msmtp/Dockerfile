FROM debian:latest

COPY tools/setup-msmtp.sh setup-msmtp.sh

RUN /bin/bash -ex /setup-msmtp.sh

COPY conf/msmtprc /etc/msmtprc

EXPOSE 25 465 587

ENTRYPOINT ["tail", "-f", "/dev/null"]
