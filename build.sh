#!/bin/bash
sudo apt-get update
echo `date`
old_path=`pwd`
sudo mkdir /test && cd /test
sudo curl -OL https://github.com/google/protobuf/releases/download/v3.6.0/protoc-3.6.0-linux-x86_64.zip
sudo apt-get install unzip
sudo unzip protoc-3.6.0-linux-x86_64.zip -d protoc3
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/
protoc --version
sudo curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
sudo alias nuget="mono /usr/local/bin/nuget.exe"

cd $old_path
echo `pwd`
echo '-------------------------------------------'
sudo mkdir /home/c -p 
for file in `ls | grep proto |grep -v grep`
do
echo $file
sudo protoc --proto_path=./ --csharp_out=/home/c  --csharp_opt=file_extension=.g.cs $file
done
ls /home/c
echo 'eeeee'


sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo apt install apt-transport-https
sudo echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel -y
echo '-------------------------------------'
nuget


