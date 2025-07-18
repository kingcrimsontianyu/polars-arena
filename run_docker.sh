#!/usr/bin/env bash

# original
# polars_benchmark_dir=polars-benchmark
# fireduck
# polars_benchmark_dir=polars-tpch

# workdir=/home/rapids

# docker run --name tialiu-polars-benchmark --rm \
# --workdir=$workdir \
# --gpus all --pull always -it --privileged=true --cap-add=SYS_ADMIN --user=root \
# --mount type=bind,src=$(pwd)/../$polars_benchmark_dir,dst=$workdir/polars-benchmark \
# --mount type=bind,src=.,dst=$workdir \
# --hostname=custom-polars-benchmark \
# --entrypoint="$workdir/entrypoint.sh" \
# rapidsai/base:25.04-cuda12.8-py3.11


#!/usr/bin/env bash

host_srcdir=$(pwd)
docker_workdir=/home/${USER}

docker run \
--name ${USER}-polars-arena-ctn --rm \
--workdir=$docker_workdir \
--gpus all -it --privileged=true --cap-add=SYS_ADMIN \
--mount type=bind,src=$host_srcdir,dst=$docker_workdir \
--volume /run/udev:/run/udev:ro \
--hostname=polars-arena \
--entrypoint="$docker_workdir/entrypoint.sh" \
${USER}-polars-arena-img