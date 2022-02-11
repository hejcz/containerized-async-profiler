#! /bin/bash

docker stop app
docker run -d --rm --mount source=async-profiler,target=/profiler --security-opt seccomp=custom-seccomp.json --name app async-profiler-test-app
docker run -it --rm --pid=container:app --mount source=async-profiler,target=/profiler --name profiler async-profiler-test-profiler

# su-exec-0.2/su-exec 1000:1000 /profiler/profiler.sh -d 20 -e cpu  -o html -f "/tmp/fg.html" 1