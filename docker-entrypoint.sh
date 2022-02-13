#!/usr/bin/env sh

export USER="${USER:-$(whoami)}"
export GROUP="${GROUP:-"$USER"}"

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec nginx -g 'daemon off;'

