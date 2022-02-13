#!/usr/bin/env sh

export USER="${USER:-$(whoami)}"
export GROUP="${GROUP:-"$USER"}"

if ! getent passwd "$USER"
then
    useradd --system "$USER"
fi

if ! getent group "$GROUP"
then
    groupadd --system "$GROUP"
fi

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

exec nginx -g 'daemon off;'

