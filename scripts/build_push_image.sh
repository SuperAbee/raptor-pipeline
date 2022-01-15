#! /bin/bash

rm raptor -rf
git clone https://github.com/SuperAbee/raptor.git
cd raptor
go build

docker build -t superabee/raptor:latest .

docker push superabee/raptor:latest