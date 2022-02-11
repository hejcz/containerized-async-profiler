#! /bin/bash

cd app
mvn clean install
docker build -t async-profiler-test-app .
cd ../profiler
docker build -t async-profiler-test-profiler .