#!/usr/bin/env sh
set -eu

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec "$@"

