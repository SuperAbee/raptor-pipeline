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
if [ ! -e /usr/lib/golang/bin/go ]
then
    yum install golang -y
fi

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
