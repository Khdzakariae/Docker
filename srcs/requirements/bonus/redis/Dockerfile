FROM debian:latest

RUN apt-get update && apt-get install -y \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

COPY conf/redis.conf /etc/redis/redis.conf

RUN mkdir -p /var/lib/redis /var/log/redis && \
    chown -R redis:redis /var/lib/redis /var/log/redis /etc/redis && \
    chmod -R 755 /var/lib/redis /var/log/redis

EXPOSE 6379

USER redis
WORKDIR /var/lib/redis
CMD ["redis-server", "/etc/redis/redis.conf"]