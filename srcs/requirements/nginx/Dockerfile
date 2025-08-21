FROM debian:12

COPY nginx/tools/setup.sh /setup.sh
COPY nginx/conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY bonus/website/index.html /website/index.html

RUN bash /setup.sh && rm /setup.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
