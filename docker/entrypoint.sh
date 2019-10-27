#!/bin/sh

set -u
set -e

DATA_DIR=/usr/share/nginx/html/data

# Fetch initial data
feminicides-update all "$DATA_DIR"

crond -s /var/spool/cron/crontabs -L /var/log/cron/cron.log 

exec nginx -g "daemon off;"

