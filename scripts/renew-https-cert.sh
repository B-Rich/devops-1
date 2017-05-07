#!/bin/bash

PROJECT="/home/tk/tksync/proj/letsencrypt-auto"
NGINX_CONF="/etc/nginx/sites-enabled/default"

# turn off NGINX https so that the URL below is
# accessible (in case certification expires):
# http://www.approach0.xyz/.well-known/acme-challenge/xxx
# TODO
# cd "$NGINX_CONF"
# systemctl restart nginx

# renew and overwrite old certificate.
cd "$PROJECT"
./letsencrypt.sh
systemctl restart nginx
