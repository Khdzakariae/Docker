FROM debian:latest

# Install msmtp and SASL auth modules
RUN apt-get update && apt-get install -y \
    msmtp \
    libsasl2-modules \
    ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy setup script
COPY tools/setup-msmtp.sh /setup-msmtp.sh
RUN chmod +x /setup-msmtp.sh

ENTRYPOINT ["/setup-msmtp.sh"]
CMD ["msmtp", "start-fg"]
