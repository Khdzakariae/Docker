FROM debian:12

COPY tools/setup.sh /setup.sh
COPY conf/redis.conf /etc/redis/redis.conf

RUN chmod +x /setup.sh && /setup.sh

EXPOSE 6379

USER redis
WORKDIR /var/lib/redis

CMD ["redis-server", "/etc/redis/redis.conf"]
