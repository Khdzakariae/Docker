FROM debian:latest

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY create-user.sh /usr/local/bin/create-user.sh
RUN chmod +x /usr/local/bin/create-user.sh

EXPOSE 3306

CMD ["/bin/bash", "-c", "mariadbd-safe & sleep 10 && /usr/local/bin/create-user.sh && tail -f /dev/null"]
