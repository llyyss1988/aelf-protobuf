#!/bin/bash
sudo apt-get update
echo `date`
mkdir /home/c -p 
for file in `ls | grep proto |grep -v grep`
do
echo $file
protoc --proto_path=./aelf-protobuf --csharp_out=/home/c  --csharp_opt=file_extension=.g.cs $file
done
ls /home/c
