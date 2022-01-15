#!/bin/bash

git clone https://github.com/SuperAbee/raptor-chart.git
helm package raptor-chart/
helm install raptor raptor-0.1.0.tgz