FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get --no-install-recommends install -y nginx-full ssl-cert

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME ["/data/files"]

RUN mkdir /data/temp \
 && cp /etc/ssl/private/ssl-cert-snakeoil.key /etc/nginx/ssl.key \
 && cp /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/nginx/ssl.pem \
 && chmod 444 /etc/nginx/ssl.key \
 && chmod -R 777 /data/temp /var/lib/nginx /var/log/nginx

CMD ["nginx", "-g", "daemon off;"]

