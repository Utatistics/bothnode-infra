#!/bin/bash

# logging the execution result
exec > /var/log/pkg_install.log 2>&1

# update repository 
add-apt-repository ppa:ethereum/ethereum
apt-get update
apt-get upgrade

# install as the root user
apt-get -y install network-manager
apt-get -y install net-toolsbot
apt-get -y install tree
apt-get -y install jq
apt-get -y install unzip
apt-get -y install logrotate
apt-get -y install python3-pip
apt-get -y install python3-venv

# install docker
apt-get install -y apt-transport-https
apt-get install -y ca-certificates
apt-get install -y gnupg-agent
apt-get install -y software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get install -y docker-ce
apt-get install -y docker-ce-cli
apt-get install -y containerd.io
gpasswd -a ubuntu docker
newgrp docker
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
dockerusermod -aG docker $USER

# install docker-compose
VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install as an user
sudo -u ubuntu bash <<'EOF'
# install nvm, node and npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source /home/ubuntu/.nvm/nvm.sh
source /home/ubuntu/.bashrc
nvm install --lts

# install bothnode
python3 -m venv /home/ubuntu/.venv
git clone https://github.com/Utatistics/bothnode.git /home/ubuntu/bothnode
mkdir -p /home/ubuntu/.bothnode/log

EOF

echo completed!
