#!/bin/bash
cd ~
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-add-repository ppa:fish-shell/release-2
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install dotnet-sdk-2.0.2 -y
sudo apt-get install nodejs -y
sudo apt-get install fish -y
sudo apt-get install python-certbot-nginx -y
sudo apt-get install nginx  -y
sudo apt-get install build-essential -y


sudo npm install -g pm2 ghost-cli 

sudo chsh laci -s /usr/bin/fish

rm nodesource_setup.sh