#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo snap install -y postman
sudo apt install -y neovim timeshift  


# Docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install -y docker-ce

sudo usermod -aG docker ${USER}
su - ${USER}
sudo usermod -aG docker chris


# MongoDB

wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.20_amd64.deb
sudo dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.20_amd64.deb

sudo apt update
sudo apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

# Obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.3/obsidian_1.0.3_amd64.deb
sudo dpkg -i obsidian_1.0.3_amd64.deb


# Chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# VS Code
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code


# Java
sudo gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/oracle-jdk11-installer.gpg --keyserver keyserver.ubuntu.com --recv-keys EA8CACC073C3DB2A

sudo apt update

sudo mkdir -p /var/cache/oracle-jdk11-installer-local/
sudo cp jdk-11.0.13_linux-x64_bin.tar.gz /var/cache/oracle-jdk11-installer-local/
sudo apt install -y oracle-java11-installer-local
sudo echo "JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"" >> /etc/environment
source /etc/environment
# echo $JAVA_HOME

# Discord

sudo apt update
sudo apt install gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi -y ~/discord.deb 

# RunJS
wget https://github.com/lukehaas/RunJS/releases/download/v2.7.4/RunJS-2.7.4.AppImage
sudo chmod u+x RunJS-2.7.4.AppImage


# NodeJS
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs npm
sudo pnpm install -g nodemon serve


# SSH
