#!/usr/bin/with-contenv ash
exec /usr/sbin/sshd -D -e -f /etc/ssh/sshd_config
