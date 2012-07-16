#!/bin/sh

keyfile="/usr/local/etc/unbound/root.key"

curfile=$(egrep -v '^;' < $keyfile | md5)
unbound-anchor -a $keyfile
newfile=$(egrep -v '^;' < $keyfile | md5)

if [ "$curfile" != "$newfile" ]; then
        echo "Root zone DNSSEC trust-keys was updated!"
fi
