#! /bin/bash

docker stop app

# doesn't need seccomp nor privileged
docker run -d --rm --mount source=async-profiler,target=/profiler --name app async-profiler-test-app

# requires privileged to change kptr_restrict and perf_event_paranoid
# required net for fdtransfer option in profiler
docker run -it --rm --privileged \
  --pid=container:app \
  --net=container:app \
  --mount source=async-profiler,target=/profiler \
  --name profiler \
  async-profiler-test-profiler