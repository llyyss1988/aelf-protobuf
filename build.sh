#!/bin/bash
sudo apt-get update
echo `date`
old_path=`pwd`
sudo mkdir /test && cd /test
curl -OL https://github.com/google/protobuf/releases/download/v3.6.0/protoc-3.6.0-linux-x86_64.zip
apt-get install unzip
unzip protoc-3.6.0-linux-x86_64.zip -d protoc3
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/
protoc --version

cd $old_path
echo `pwd`
echo '-------------------------------------------'
sudo mkdir /home/c -p 
for file in `ls | grep proto |grep -v grep`
do
echo $file
protoc --proto_path=./ --csharp_out=/home/c  --csharp_opt=file_extension=.g.cs $file
done
ls /home/c
echo 'eeeee'
