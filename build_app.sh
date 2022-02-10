#! /bin/bash

cd app
mvn clean install
docker build -t async-profiler-test-app .