#!/bin/bash
set -e

# Set msmtp main configuration for Gmail
postconf -e "relayhost = [${GMAIL_HOST}]:${GMAIL_PORT}"
postconf -e "smtp_use_tls = yes"
postconf -e "smtp_tls_security_level = encrypt"
postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_security_options = noanonymous"
postconf -e "smtp_sasl_password_maps = hash:/etc/msmtp/sasl_passwd"
postconf -e "smtp_sasl_tls_security_options = noanonymous"

# Configure sender
postconf -e "myorigin = /etc/mailname"
echo "${GMAIL_USER}" > /etc/mailname

# Authentication credentials
echo "[${GMAIL_HOST}]:${GMAIL_PORT} ${GMAIL_USER}:${GMAIL_PASS}" > /etc/msmtp/sasl_passwd
postmap /etc/msmtp/sasl_passwd
chmod 600 /etc/msmtp/sasl_passwd /etc/msmtp/sasl_passwd.db

exec "$@"
