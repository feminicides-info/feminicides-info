#!/bin/sh

# crond -s /var/spool/cron/crontabs -f -L /var/log/cron/cron.log 
crond -s /var/spool/cron/crontabs -L /var/log/cron/cron.log 

exec nginx -g "daemon off;"

