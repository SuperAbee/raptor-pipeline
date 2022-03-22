#!/bin/bash

# workspace
mkdir tmp
cd tmp

# helm
if [ ! -e /usr/local/bin/helm ]
then
    wget https://mirrors.huaweicloud.com/helm/v3.7.2/helm-v3.7.2-linux-amd64.tar.gz
    tar -zxvf helm-v3.7.2-linux-amd64.tar.gz
    mv linux-amd64/helm /usr/local/bin/helm
    chmod a+x /usr/local/bin/helm
fi

# git
if [ ! -e /usr/libexec/git-core/git ]
then
    yum install git -y
fi

# go
wget -c https://storage.googleapis.com/golang/go1.17.3.linux-amd64.tar.gz
tar -C /usr/local/ -zxvf go1.17.3.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

# pipeline
rm raptor-pipeline -rf
git clone https://github.com/SuperAbee/raptor-pipeline.git
cd raptor-pipeline

for script in `ls scripts`
do
    chmod 777 "scripts/$script"
done

go build
./pipeline &
cd -
