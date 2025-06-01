FROM debian:latest

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

COPY create-user.sh /usr/local/bin/create-user.sh
RUN chmod +x /usr/local/bin/create-user.sh

USER mysql

EXPOSE 3306

CMD ["mysqld"]
