#!/usr/bin/env sh

export USER="${USER:-"$(id -u)"}"
export GROUP="${GROUP:-"$(id -g)"}"

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec nginx -g 'daemon off;'

