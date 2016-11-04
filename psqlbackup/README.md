This container backsup a psql database to s3 and encrypts it with a GPG key.


## You can call restore to restore from S3 also:

currently it pulls down and decrypts the file from s3. this will have been an encrypted .sql file.

now, using this, it needs to push this back up into the database.

so now it does upload the encrypted file. Currently there is no easy way to decrypt, but simple, by downloading from s3 getting the key and decrypting (right click).

emptying databases of data that don't need to exist indefinately, can be done from the controlling program rather than when the backups are done, unless thats actually a useful featurew