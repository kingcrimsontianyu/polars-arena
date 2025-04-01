#!/usr/bin/env bash

workdir=/home/rapids

docker run --name tialiu-polars-benchmark-1 --rm \
--workdir=$workdir \
--gpus all --pull always -it --privileged=true --cap-add=SYS_ADMIN --user=root \
--mount type=bind,src=/nvme/1/tialiu/polars/polars-benchmark,dst=$workdir/polars-benchmark \
--mount type=bind,src=.,dst=$workdir \
--hostname=custom-polars-benchmark \
--entrypoint="$workdir/entrypoint.sh" \
rapidsai/base:25.04a-cuda12.8-py3.12
