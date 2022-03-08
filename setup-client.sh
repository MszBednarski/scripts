#!/bin/bash
# on ubuntu 20.04
export CONFIG=/etc/ssh/sshd_config
if [ -z ${var+x} ]; then echo "SET HOST ENV VAR FIRST"; exit; fi
echo "Setting up ssh id and closing the server for password connections."
ssh -i ~/.ssh/id_rsa ubuntu@$HOST
sudo echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo echo "ChallengeResponseAuthentication no" >> $CONFIG
sudo echo "PasswordAuthentication no" >> $CONFIG
sudo echo "UsePAM no" >> $CONFIG
sudo echo "PermitRootLogin no" >> $CONFIG
sudo echo "PermitRootLogin prohibit-password" >> $CONFIG
sudo systemctl reload ssh