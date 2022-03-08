#!/bin/bash
# on ubuntu 20.04
# curl <link> | sh
sudo apt update
sudo apt upgrade -y
sudo apt install -y openssh-server vim git htop
sudo ubuntu-drivers autoinstall
sudo ufw allow ssh