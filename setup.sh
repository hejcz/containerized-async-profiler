#! /bin/bash

# setup async-profiler volume
docker volume create async-profiler
docker run --mount source=async-profiler,target=/profiler -i --rm alpine:3.15.0 /bin/sh <<EOF
rm -rf /profiler/*
wget https://github.com/jvm-profiling-tools/async-profiler/releases/download/v2.6/async-profiler-2.6-linux-x64.tar.gz
tar -xf async-profiler-2.6-linux-x64.tar.gz --strip-components=1 -C /profiler
cd /profiler
EOF

# build project
cd app
mvn clean install
docker build -t async-profiler-test-app .
