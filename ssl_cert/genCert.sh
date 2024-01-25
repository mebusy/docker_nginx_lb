#!/bin/sh

set -e

openssl genrsa -out serv.key 2048

openssl req -new -x509 -days 3650 -key serv.key -out serv.crt \
    -subj "/C=PK/ST=ISB/L=ISB/O=fakecom/OU=fakecom/CN=mebusys-imac/emailAddress=abc@fake.com"


