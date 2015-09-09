#!/bin/bash 

SCRIPT="/usr/src/kernels/$(uname -r)/scripts/sign-file"

# Generate your own keys - For example:
# openssl req -new -x509 -newkey rsa:2048 -keyout key.priv -outform DER -out key.der -nodes -days 912 -subj "/CN=MyPrivateKey/"

KEY_PRIV="key.priv" 
KEY_DER="key.der" 

for MODULE in $(dirname $(modinfo -n vboxdrv))/vbox*;
do
	echo "signing " $MODULE
	perl $SCRIPT sha512 $KEY_PRIV $KEY_DER $MODULE
done
