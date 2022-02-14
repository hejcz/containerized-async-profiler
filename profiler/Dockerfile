FROM ubuntu:20.04

RUN apt-get update \
  && apt-get -y install wget unzip gcc build-essential \
  && wget https://github.com/ncopa/su-exec/archive/refs/tags/v0.2.zip \
  && unzip v0.2.zip \
  && rm v0.2.zip \
  && cd su-exec-0.2 \
  && make \
  && apt-get -y remove wget unzip gcc build-essential \
  && apt-get -y autoremove \
  && apt-get clean

COPY docker_entrypoint.sh disable_kernel_perf_protection.sh enable_kernel_perf_protection.sh /root/

ENTRYPOINT /root/docker_entrypoint.sh