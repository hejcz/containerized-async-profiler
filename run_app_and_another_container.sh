#! /bin/bash

docker stop app
docker run -d --rm --mount source=async-profiler,target=/profiler --security-opt seccomp=default.json --name app async-profiler-test-app
docker run -it --rm --pid=container:app --mount source=async-profiler,target=/profiler ubuntu:20.04 bash

# useradd -ms /bin/bash app && su app
#  /profiler/profiler.sh -d 5 -e cpu -i 1us -o flat 1