#!/usr/bin/env bash

# modules needed: pip install linetimer pydantic pydantic-settings

polar_bench_dir=/home/rapids/polars-benchmark
cur_dir=$(pwd)

export PYTHONPATH=$polar_bench_dir

# export CUDA_VISIBLE_DEVICES=6

# export KVIKIO_COMPAT_MODE=ON
export KVIKIO_COMPAT_MODE=OFF

# export CUFILE_LOGGING_LEVEL=TRACE
export CUFILE_LOGGING_LEVEL=ERROR
export CUFILE_ALLOW_COMPAT_MODE=OFF
export CUFILE_FORCE_COMPAT_MODE=OFF

# export KVIKIO_TASK_SIZE=262144
# export KVIKIO_TASK_SIZE=131072

# export KVIKIO_GDS_THRESHOLD=0

# export KVIKIO_NTHREADS=32

# export RUN_DROP_CACHES=ON
# export RUN_PRINT_PAGE_CACHE_INFO=ON
export RUN_ITERATIONS=5

export SCALE_FACTOR=100.0
export RUN_POLARS_GPU=true
export CUDA_MODULE_LOADING=EAGER

# polars benchmark pre-loads the engine by creating a temp file
# in /tmp by default. It is necessary to ensure the directory
# is ext4.
export TMPDIR=/home/rapids/polars-benchmark

cd $polar_bench_dir

# SCALE_FACTOR=100.0 PATH_TABLES=data/tables-pyarrow RUN_POLARS_GPU=true CUDA_MODULE_LOADING=EAGER python -m queries.polars.q5

# Run query 5
python -m queries.polars.q5

# Run all queries
# python -m queries.polars

# Run all
# KVIKIO_NTHREADS=1   python -m queries.polars > $cur_dir/all_cold_1t_5iter.txt
# KVIKIO_NTHREADS=4   python -m queries.polars > $cur_dir/all_cold_4t_5iter.txt
# KVIKIO_NTHREADS=32  python -m queries.polars > $cur_dir/all_cold_32t_5iter.txt
# KVIKIO_NTHREADS=64  python -m queries.polars > $cur_dir/all_cold_64t_5iter.txt
# KVIKIO_NTHREADS=112 python -m queries.polars > $cur_dir/all_cold_112t_5iter.txt