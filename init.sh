#!/bin/bash

# helm
mkdir tmp
cd tmp
wget https://mirrors.huaweicloud.com/helm/v3.7.2/helm-v3.7.2-linux-amd64.tar.gz
tar -zxvf helm-v3.7.2-linux-amd64.tar.gz
cd linux-amd64/
mv helm /usr/local/bin/helm
chmod a+x /usr/local/bin/helm
cd ~/tmp

# git
yum install git -y

# go
yum install golang -y