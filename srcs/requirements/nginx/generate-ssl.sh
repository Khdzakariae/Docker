#!/bin/bash

nginx -g 'daemon off;'

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/privkey.pem \
  -out /etc/nginx/ssl/cert.pem \
  -subj "/C=US/ST=DevState/L=DevCity/O=DevOrg/CN=localhost"
