#!/bin/bash
set -e

apt-get update && apt-get install -y \
    postfix \
    msmtp \
    ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

