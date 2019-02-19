#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CERT_DIR=`mktemp -d -p "$DIR"`

CERT_NAME=haproxy

sudo openssl genrsa -out $CERT_DIR/$CERT_NAME.key 2048
sudo openssl req -new -key $CERT_DIR/$CERT_NAME.key \
                   -out $CERT_DIR/$CERT_NAME.csr
sudo openssl x509 -req -days 365 -in $CERT_DIR/$CERT_NAME.csr \
                    -signkey $CERT_DIR/$CERT_NAME.key \
                    -out $CERT_DIR/$CERT_NAME.crt
sudo cat $CERT_DIR/$CERT_NAME.crt $CERT_DIR/$CERT_NAME.key \
           | sudo tee $CERT_DIR/$CERT_NAME.pem
