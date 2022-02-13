#!/bin/bash

# - before
# apt update
# apt install git
# git clone https://github.com/osorosia/born2beroot.git

# - after
# crontab -u root -e
#   -> */10 * * * * bash /ft/monitoring.sh

# - check
# ufw status

# apt
apt-get update
apt-get install -y \
    libpam-pwquality \
    libpwquality-tools \
    sudo \
    sysstat \
    ufw \

# user, group
adduser rnishimo sudo

addgroup user42
adduser rnishimo user42

# ssh
cat ./files/my_sshd.conf > /etc/ssh/sshd_config.d/my_sshd.conf
chmod 644 /etc/ssh/sshd_config.d/my_sshd.conf

# ufw
ufw enable
ufw allow 4242

# cron
mkdir /fd
cat ./files/monitoring.sh > /fd/monitoring.sh 
chmod -R 755 /ft

# sudo
mkdir -p /var/log/sudo
cat ./files/my_sudoers > /etc/sudoers.d/my_sudoers
chmod 755 /etc/sudoers.d/my_sudoers

# password
cat ./files/pwquality.conf > /etc/security/pwquality.conf
chmod 644 /etc/security/pwquality.conf
