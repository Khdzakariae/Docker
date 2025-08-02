FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends rsyslog && \
    rm -rf /var/lib/apt/lists/*

# Enable UDP 514 logging
RUN sed -i '/imudp/s/^#//g' /etc/rsyslog.conf && \
    echo 'input(type="imudp" port="514")' >> /etc/rsyslog.conf && \
    echo 'template(name="RemoteFormat" type="string" string="/var/log/remote/%HOSTNAME%/%PROGRAMNAME%.log")' >> /etc/rsyslog.conf && \
    echo 'if ($fromhost-ip != "127.0.0.1") then { action(type="omfile" dynaFile="RemoteFormat") }' >> /etc/rsyslog.conf

EXPOSE 514/udp
CMD ["rsyslogd", "-n"]
