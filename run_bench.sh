#!/usr/bin/env bash

polar_bench_dir=/home/rapids/polars-benchmark
cd $polar_bench_dir

# SCALE_FACTOR=100.0 PATH_TABLES=data/tables-pyarrow RUN_POLARS_GPU=true CUDA_MODULE_LOADING=EAGER python -m queries.polars.q5

SCALE_FACTOR=100.0 RUN_POLARS_GPU=true CUDA_MODULE_LOADING=EAGER python -m queries.polars.q5