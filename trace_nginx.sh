#!/bin/bash

# Name of your Nginx container
CONTAINER_NAME="nginx-container"

# Infinite loop to trace logs
while true; do
    clear
    echo "===== Logs for $CONTAINER_NAME ====="
    docker logs --tail 50 $CONTAINER_NAME
    sleep 2
done
