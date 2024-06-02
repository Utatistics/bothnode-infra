#!/bin/bash

# logging the execution result
exec > /var/log/pkg_install.log 2>&1

# update repository 
add-apt-repository ppa:ethereum/ethereum
apt-get update
apt-get upgrade

# install as the root user
apt-get -y install network-manager
apt-get -y install net-tools
apt-get -y install tree
apt-get -y install jq
apt-get -y install unzip
apt-get -y install python3-pip
apt-get -y install python3-venv

# install as an user
sudo -u ubuntu bash <<'EOF'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source /home/ubuntu/.nvm/nvm.sh
source /home/ubuntu/.bashrc

# install bothnode
python3 -m venv /home/ubuntu/.venv
git clone https://github.com/Utatistics/bothnode.git /home/ubuntu/bothnode
EOF

echo completed!
