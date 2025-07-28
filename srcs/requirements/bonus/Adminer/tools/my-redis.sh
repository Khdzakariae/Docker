redis-server --daemonize yes && sleep 1 
redis-cli < /my-dir/my-data.redis 
redis-cli save 
redis-cli shutdown 
redis-server 