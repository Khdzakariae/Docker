FROM debian:bullseye

# Install Redis
RUN apt-get update && apt-get install -y \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

# Copy Redis configuration
COPY conf/redis.conf /etc/redis/redis.conf

# Create redis directories and set permissions
RUN mkdir -p /var/lib/redis /var/log/redis && \
    chown -R redis:redis /var/lib/redis /var/log/redis /etc/redis && \
    chmod -R 755 /var/lib/redis /var/log/redis

# Expose Redis port
EXPOSE 6379

# Start Redis as redis user
USER redis
WORKDIR /var/lib/redis
CMD ["redis-server", "/etc/redis/redis.conf"]