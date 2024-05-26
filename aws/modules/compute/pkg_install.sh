#!/bin/bash

# logging the execution result
exec > /var/log/pkg_install.log 2>&1

# update repository 
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get upgrade

# common util 
sudo apt-get -y install network-manager
sudo apt-get -y install net-tools
sudo apt-get -y install tree
sudo apt-get -y install jq
sudo apt-get -y install unzip

# setup python ecosystem
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-venv
python3 -m venv ~/.venv

# set up JavaScript ecosystem.
sudo apt-get install -y npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# install bothnode 
git clone https://github.com/Utatistics/bothnode.git /home/ubuntu/bothnode
