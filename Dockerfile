FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get --no-install-recommends install -y nginx-full ssl-cert gettext-base

COPY nginx.conf /etc/nginx/nginx.conf.template
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/data/files"]

RUN mkdir -p /data/temp \
 && cp /etc/ssl/private/ssl-cert-snakeoil.key /etc/nginx/ssl.key \
 && cp /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/nginx/ssl.pem \
 && echo "" > /etc/nginx/nginx.conf \
 && chmod 444 /etc/nginx/ssl.key \
 && chmod -R 777 /etc/nginx/nginx.conf /data/temp /var/lib/nginx /var/log/nginx

ENV CLIENT_MAX_BODY_SIZE="2M"

CMD ["/docker-entrypoint.sh"]

