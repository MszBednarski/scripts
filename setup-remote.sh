#!/bin/bash
# on ubuntu 20.04
# curl <link> -sSf | sh
sudo apt update
sudo apt upgrade -y
sudo apt install -y openssh-server
sudo ufw allow ssh