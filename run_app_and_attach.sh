#! /bin/bash

docker stop app
docker run -d --rm --mount source=async-profiler,target=/profiler --name app async-profiler-test-app
docker run -it --rm --pid=container:app --mount source=async-profiler,target=/profiler ubuntu:20.04 bash