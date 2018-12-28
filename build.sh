#!/bin/bash
sudo apt-get update
echo `date`
wget -q https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1 -y
dotnet --version

curl -OL https://github.com/google/protobuf/releases/download/v3.6.0/protoc-3.6.0-linux-x86_64.zip
apt-get install unzip
unzip protoc-3.6.0-linux-x86_64.zip -d protoc3
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/
protoc --version

sudo mkdir /home/c -p 
for file in `ls | grep proto |grep -v grep`
do
echo $file
protoc --proto_path=./aelf-protobuf --csharp_out=/home/c  --csharp_opt=file_extension=.g.cs $file
done
ls /home/c
