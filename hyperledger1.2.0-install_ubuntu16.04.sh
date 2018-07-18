#!/bin/bash

echo '**************************INSTALLING PRE-REQS**************************'
echo -e '\t Updating packages...'
sudo apt update > /dev/null 2>&1

echo -e '\t Installing Curl, Golang, Node.js with npm, Python, and Docker...'
sudo apt install -y curl golang-go nodejs npm python docker > /dev/null 2>&1
export GOPATH=$HOME/go > /dev/null 2>&1
export PATH=$PATH:$GOPATH/bin > /dev/null 2>&1

echo -e '\t Installing docker-ce...'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /dev/null 2>&1
sudo apt update > /dev/null 2>&1
apt-cache policy docker-ce > /dev/null 2>&1
sudo apt install -y docker-ce docker-compose > /dev/null 2>&1

echo -e '\t Installing upgrades...'
sudo apt upgrade > /dev/null 2>&1

echo -e '\t Done with pre-reqs'

echo '**************************INSTALLING FABRIC 1.2.0**************************'
echo -e '\t Installing...'
sudo curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh | sudo bash -s 1.2.0
echo -e '\t Changing permissions...'
sudo chmod 777 -R fabric-samples

echo '**************************FINISHED**************************'

