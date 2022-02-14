#! /bin/bash

trap '/root/enable_kernel_perf_protection.sh' EXIT

/root/disable_kernel_perf_protection.sh
TARGET_PID=1
TARGET_UID_GID=$(stat -c "%u:%g" /proc/$TARGET_PID)
su-exec-0.2/su-exec $TARGET_UID_GID /profiler/profiler.sh --fdtransfer -d 20 -e cpu -o html -f "/tmp/fg.html" $TARGET_PID