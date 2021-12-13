#!/bin/sh
# System updates
sudo apt update -y
sudo apt-get upgrade -y

# Install Node Red
bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)
sudo systemctl enable nodered
sudo systemctl start nodered

# Install VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

# Curl
sudo apt install curl -y

# Node JS 14
sudo apt update
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
cat /etc/apt/sources.list.d/nodesource.list
deb https://deb.nodesource.com/node_14.x focal main
deb-src https://deb.nodesource.com/node_14.x focal main
sudo apt -y install nodejs

# Python 3.9
sudo apt update -y
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9

# MariaDB Connector
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo apt-get install -y apt-transport-https
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade
sudo apt-get install libmariadb3 -y
sudo apt-get install libmariadb-dev -y

# MariaDB Server
sudo apt update -y
sudo apt install mariadb-server -y
sudo mysql_secure_installation

# Sort Python out for install of AEC
sudo apt install python3-pip -y

# AEC Database
sudo mysql
create database aec;
source AEC.sql