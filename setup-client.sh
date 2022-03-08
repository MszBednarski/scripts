#!/bin/bash
# on ubuntu 20.04
if [ -z ${HOST+x} ]; then echo "SET HOST ENV VAR FIRST"; exit; fi
echo "Setting up ssh id and closing the server for password connections."
ssh-copy-id -i ~/.ssh/id_rsa ubuntu@$HOST
function s() {
    ssh ubuntu@$HOST $1
}
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "Please exec ' echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers && exit'"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
ssh ubuntu@$HOST
echo "Setting up the RSA auth."
s 'echo "ChallengeResponseAuthentication no" | sudo tee -a /etc/ssh/sshd_config'
s 'echo "PasswordAuthentication no" | sudo tee -a /etc/ssh/sshd_config'
s 'echo "UsePAM no" | sudo tee -a /etc/ssh/sshd_config'
s 'echo "PermitRootLogin no" | sudo tee -a /etc/ssh/sshd_config'
s 'echo "PermitRootLogin prohibit-password" | sudo tee -a /etc/ssh/sshd_config'
s 'sudo systemctl reload ssh'