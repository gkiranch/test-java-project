#!/bin/bash

#if [ "$FORTANIX_API_KEY" == "" ] ; then
#    echo "FORTANIX_API_KEY is unset. Did you forget to run with --env or --env-file?"
#    exit 1
#fi
export MYSQL_HOST=mysql
export MYSQL_USER=root
export MYSQL_DB=todos
echo "Please enter the API key"
read API
sleep 1
echo "Logging in to the app"
echo "#-------------------------------------------#"
export FORTANIX_API_ENDPOINT="https://sdkms.fortanix.com"
export FORTANIX_API_KEY=$API
sdkms-cli app-login 2>/dev/null
login_status=$?
[[ $login_status -ne 0 ]] && { echo "Login Failed,incorrect API!!"; exit 1; }
echo "Getting db secret"
sleep 1
export MYSQL_PASSWORD=$(sdkms-cli export-object --name dbpassword)
echo "received db secret"
#echo "Decrypting encrypted file..."
#sleep 1
echo "Starting application"

/src/index.js
#sdkms-cli decrypt --name aes-key --in encrypt-poi.jar --out decrypt.jar --alg AES --mode CBC --iv 00000000000000000000000000000000

#sleep 5m

#java -jar decrypt.jar

#sleep 1
