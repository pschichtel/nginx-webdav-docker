FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get --no-install-recommends install -y nginx-full

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME ["/data/files"]

RUN mkdir /data/temp \
 && chmod -R 777 /data/temp /var/lib/nginx /var/log/nginx

CMD ["nginx", "-g", "daemon off;"]

