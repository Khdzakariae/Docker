#!/bin/bash

# Get all running container names
containers=$(docker ps --format "{{.Names}}")

# Loop through each container and print its logs
for container in $containers; do
    echo "======================"
    echo "Logs for container: $container"
    echo "======================"
    docker logs --tail 100 $container
    echo ""
done
