FROM ubuntu:latest

# Avoid prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Update, install nginx and openssh-server, clean cache
RUN apt-get update && \
    apt-get install -y nginx openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy html files to nginx web root (fix the path)
COPY ./html /usr/share/nginx/html/

# Copy custom nginx config (make sure this file exists and is correct)
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose ports (optional, but usually needed)
EXPOSE 80 22

# Start both services (nginx and ssh) in foreground
CMD service ssh start && nginx -g 'daemon off;'


