FROM ubuntu
MAINTAINER Benoit Da Mota <damota.benoit@gmail.com>

ADD build_gecode_quacode.sh build_gecode_quacode.sh
RUN bash build_gecode_quacode.sh

# a hook to attach a volume
RUN mkdir -p /mnt/scratch
WORKDIR /mnt/scratch