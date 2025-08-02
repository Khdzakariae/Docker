#!/bin/bash
set -e

echo "gmail pass is :${GMAIL_PASS}"

sed -i "s|GMAIL_PORT_HERE|${GMAIL_PORT}|g" /etc/msmtprc
sed -i "s|GMAIL_PASS_HERE|${GMAIL_PASS}|g" /etc/msmtprc
sed -i "s|GMAIL_USER_HERE|${GMAIL_USER}|g" /etc/msmtprc
sed -i "s|GMAIL_HOST_HERE|${GMAIL_HOST}|g" /etc/msmtprc

exec "$@"
