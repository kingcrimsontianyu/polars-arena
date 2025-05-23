#!/usr/bin/env bash

# original
# polars_benchmark_dir=polars-benchmark
# fireduck
polars_benchmark_dir=polars-tpch

workdir=/home/rapids

docker run --name tialiu-polars-benchmark --rm \
--workdir=$workdir \
--gpus all --pull always -it --privileged=true --cap-add=SYS_ADMIN --user=root \
--mount type=bind,src=$(pwd)/../$polars_benchmark_dir,dst=$workdir/polars-benchmark \
--mount type=bind,src=.,dst=$workdir \
--hostname=custom-polars-benchmark \
--entrypoint="$workdir/entrypoint.sh" \
rapidsai/base:25.04-cuda12.8-py3.11
