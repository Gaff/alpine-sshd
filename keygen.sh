#!/usr/bin/with-contenv ash

# A Truely diligent dockerfile would put these steps in separate scripts!
# See: https://github.com/just-containers/s6-overlay#usage

set -e
[ "$DEBUG" == 'true' ] && set -x

# Generate Host keys, if required
if [ ! -f /etc/ssh/ssh_host_* ]; then
    ssh-keygen -A
fi

# Fix permissions, if writable
if [ -d ~/.ssh ] && [ -w ~/.ssh ]; then
    chown -R root:root ~/.ssh && chmod 700 ~/.ssh/
    if [ "$(ls -A ~/.ssh)" ]; then
      chmod 600 ~/.ssh/*
    fi
fi

# Allow a key to be passed in via env
if [ -n "$AUTHORIZED_KEY" ]; then
    echo "$AUTHORIZED_KEY" >> /authorized_keys
fi
