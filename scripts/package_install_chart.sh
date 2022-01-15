#!/bin/bash

rm raptor-chart -rf
git clone https://github.com/SuperAbee/raptor-chart.git
helm package raptor-chart/
helm delete raptor -n default
helm install raptor raptor-0.1.0.tgz -n default