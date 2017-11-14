#!/usr/env/bin bash

set -e

echo "Copying certs..."
cp /etc/letsencrypt/live/infra.hi-five.us/fullchain.pem /etc/nginx/certs/
cp /etc/letsencrypt/live/infra.hi-five.us/privkey.pem   /etc/nginx/certs/

echo "Restarting proxy..."
docker kill --signal=SIGHUP proxy

echo "Done."
