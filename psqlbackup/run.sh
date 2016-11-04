#!/bin/sh
set -e # stop if any of these commands fail

: ${PGHOST:?"-e PGHOST is not set"}
: ${PGUSER:?"-e PGUSER is not set"}
: ${PGPASSWORD:?"-e PGPASSWORD is not set"}
: ${GPG_RECIPIENT:?"-e GPG_RECIPIENT is not set"}
: ${AWS_ACCESS_KEY_ID:?"-e AWS_ACCESS_KEY_ID is not set"}
: ${AWS_SECRET_ACCESS_KEY:?"-e AWS_SECRET_ACCESS_KEY is not set"}
: ${S3_BUCKET_NAME:?"-e S3_BUCKET_NAME is not set"}
: ${AWS_DEFAULT_REGION:?"-e AWS_DEFAULT_REGION is not set"}
: ${CRON_INTERVAL:?"-e CRON_INTERVAL is not set"}
: ${PREFIX:?"-e PREFIX is not set"}

# Import GPG public keys
gpg --import /keys/*

# Create and install crontab file
echo "$CRON_INTERVAL /backup.sh" >> /backup.cron
cat /backup.cron

crontab /backup.cron

tail -f /dev/null