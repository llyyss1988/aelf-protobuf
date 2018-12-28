#!/bin/bash
sudo apt-get update
dotnet --version
protoc --version
nuget

sudo mkdir ~/c -p 

for file in `ls | grep proto |grep -v grep`
do
echo $file
sudo protoc --proto_path=./ --csharp_out=~/c  --csharp_opt=file_extension=.g.cs $file
done

ls ~/c/*

