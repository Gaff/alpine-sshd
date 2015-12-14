#!/usr/bin/env sh
set -ex
cd /tmp
apk upgrade
apk update

apk add openssh rsync
mkdir -p ~root/.ssh && chmod 700 ~root/.ssh/
sed -i '/AuthorizedKeysFile/s/^/#/' /etc/ssh/sshd_config
echo -e "Port 22\n" >> /etc/ssh/sshd_config

#Add an extra AuthorizedKeysFile so that people can hard-bake their own keys if they wish.
echo -e "AuthorizedKeysFile .ssh/authorized_keys /authorized_keys\n" >> /etc/ssh/sshd_config
echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config

#apk del <applications that were used only for building, like gcc, make etc.>
rm -rf /tmp/*
rm -rf /var/cache/apk/*
