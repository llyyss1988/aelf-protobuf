#!/bin/bash
sudo apt-get update
echo `date`
#sudo apt-get install expect -y
sudo  apt-get install nodejs -y
sudo  apt-get install npm -y
sudo npm install -g npm-cli-login
echo $user $password $email
npm-cli-login -u "$1"  -p "$2" -e "$3"
npm publish
