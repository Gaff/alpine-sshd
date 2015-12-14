#!/usr/bin/with-contenv ash

# A Truely diligent dockerfile would put these steps in separate scripts!
# See: https://github.com/just-containers/s6-overlay#usage

set -e
[ "$DEBUG" == 'true' ] && set -x

# Copy default config from cache
if [ ! "$(ls -A /etc/ssh)" ]; then
   cp -a /etc/ssh.cache/* /etc/ssh/
fi

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
