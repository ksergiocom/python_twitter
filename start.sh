#!/bin/bash

MONGO_URI=$(printenv MONGO_URI)
CONSUMER_KEY=$(printenv CONSUMER_KEY)
CONSUMER_SECRET=$(printenv CONSUMER_SECRET)
ACCESS_TOKEN=$(printenv ACCESS_TOKEN)
ACCESS_TOKEN_SECRET=$(printenv ACCESS_TOKEN_SECRET)

echo "MONGO_URI=$MONGO_URI" > /app/cron/cronjob
echo "CONSUMER_KEY=$CONSUMER_KEY" >> /app/cron/cronjob
echo "CONSUMER_SECRET=$CONSUMER_SECRET" >> /app/cron/cronjob
echo "ACCESS_TOKEN=$ACCESS_TOKEN" >> /app/cron/cronjob
echo "ACCESS_TOKEN_SECRET=$ACCESS_TOKEN_SECRET" >> /app/cron/cronjob

echo "0 * * * * /usr/local/bin/python3 /app/script/main.py >> /app/cron/cron.log 2>&1" >> /app/cron/cronjob

crontab /app/cron/cronjob

cron -f
