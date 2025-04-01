#!/usr/bin/env bash

polar_bench_dir=/home/rapids/polars-benchmark

cd $polar_bench_dir/tpch-dbgen
make -j
cd $polar_bench_dir
SCALE_FACTOR=100.0 make data/tables/
