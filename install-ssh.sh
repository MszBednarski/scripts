#!/bin/bash
# on ubuntu 20.04
# curl <link> -sSf | sh
sudo apt update
sudo apt upgrade -y
sudo apt install openssh-server -y
sudo ufw allow ssh