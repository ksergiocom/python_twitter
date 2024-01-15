#!/bin/bash

MONGO_URI=$(printenv MONGO_URI)

echo "MONGO_URI=$MONGO_URI" > /app/cron/cronjob
echo "* * * * * /usr/local/bin/python3 /app/script/main.py >> /app/cron/cron.log 2>&1" >> /app/cron/cronjob

crontab /app/cron/cronjob

cron -f
