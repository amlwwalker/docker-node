# Credit for lots of this goes to: https://github.com/siomiz/PostgreSQL-S3
set -e # stop if any of these commands fail

echo "*** Starting run-backup.sh ***"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/tmp/$PREFIX-$DATE.sql"
GPG_FILE="/tmp/$PREFIX-$DATE.sql.gpg"
S3_URI="s3://$S3_BUCKET_NAME/$PREFIX-$DATE.sql.gpg"

echo "> Running pg_dumpall, host connection: " $PGHOST:$PGPORT:$PGDATABASE:$PGUSER:$PGPASSWORD


#testing:
pg_dump -Fc -f $FILE



# pg_dumpall --clean --file=$FILE
echo "printing " $FILE
cat $FILE

echo "> Encrypting dump file using gpg"
gpg --always-trust -v -e -r $GPG_RECIPIENT -o $GPG_FILE $FILE

echo "> Uploading to S3"
AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" aws s3 cp "$GPG_FILE" "$S3_URI"

# Clean up
rm $FILE
rm $GPG_FILE

echo "Done."