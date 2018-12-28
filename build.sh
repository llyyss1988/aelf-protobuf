#!/bin/bash
sudo apt-get update


old_path=`pwd`
sudo mkdir /test && cd /test
sudo curl -OL https://github.com/google/protobuf/releases/download/v3.6.0/protoc-3.6.0-linux-x86_64.zip
sudo apt-get install unzip
sudo unzip protoc-3.6.0-linux-x86_64.zip -d protoc3
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/
echo 'protoc-------'
protoc --version
echo 'dotnet-------'
dotnet --version
echo 'nuget--------'
nuget



cd $old_path
sudo mkdir /tmp/c -p 
for file in `ls | grep proto |grep -v grep`
do
echo $file
sudo protoc --proto_path=./ --csharp_out=/tmp/c  --csharp_opt=file_extension=.g.cs $file
done
cuso cp aelf-lys-2018.nuspec /tmp/c/
echo '-----------------------------------'
ls /tmp/c/*
echo '-----------------------------------'

cd /tmp/c
nuget  push aelf-lys-2018.2.2.2.nupkg  oy2ef7s5vvskzakubp6qtphejve6pcbudbo5xbajm2vqae  -src https://www.nuget.org
echo  '-----------------------------'
echo  '-----------------------------'
