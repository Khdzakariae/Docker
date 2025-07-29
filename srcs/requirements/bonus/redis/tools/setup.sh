#!/bin/bash
set -e

apt-get update && \
apt-get install -y redis-server && \
rm -rf /var/lib/apt/lists/*

mkdir -p /var/lib/redis /var/log/redis

chown -R redis:redis /var/lib/redis /var/log/redis /etc/redis
chmod -R 755 /var/lib/redis /var/log/redis
