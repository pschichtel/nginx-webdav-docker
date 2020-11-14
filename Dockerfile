FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get --no-install-recommends install -y nginx-full gettext-base

COPY nginx.conf /etc/nginx/nginx.conf.template
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/data/files"]

RUN mkdir /data/temp \
 && chmod -R 777 /data/temp /var/lib/nginx /var/log/nginx /etc/nginx

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]

