

FROM nginx:latest 
COPY ./html usr/share/nginx/html/index

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && \
    apt-get install -y nginx openssh-server && \
    apt-get clean

