#!/usr/bin/env bash

docker run --name tialiu-polars-benchmark-1 --rm \
--workdir=/home/rapids \
--gpus all --pull always -it --privileged=true --cap-add=SYS_ADMIN --user=root \
--mount type=bind,src=/nvme/1/tialiu/polars/polars-benchmark,dst=/home/rapids/polars-benchmark \
--mount type=bind,src=$(pwd),dst=/home/rapids/local \
rapidsai/base:25.04a-cuda12.8-py3.12 \
bash
# /bin/bash -c "apt update && apt install -y make gcc git && pip install linetimer pydantic pydantic-settings"
