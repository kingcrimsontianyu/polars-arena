#!/usr/bin/env bash

# If there is data generation error, remove the .venv directory in $polar_bench_dir, and rerun.

polar_bench_dir=/home/rapids/polars-benchmark

cd $polar_bench_dir/tpch-dbgen
make -j
cd $polar_bench_dir

# SCALE_FACTOR=100.0 make data/tables/

# SCALE_FACTOR=1.0 PATH_TABLES=data/tables make tables-pyarrow
SCALE_FACTOR=100.0 PATH_TABLES=data/tables make tables-pyarrow