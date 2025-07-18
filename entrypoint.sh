#!/usr/bin/env bash

# Exit on error
set -e

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip

# If polars-benchmark directory does not exist, download from github
if [ ! -d "polars-benchmark" ]; then
    git clone https://github.com/kingcrimsontianyu/polars-benchmark
fi


cd "polars-benchmark"

# If the target branch ("biu") does not exist, create one
target_branch="biu"
current_branch=$(git branch --list $target_branch)
if [[ -z $current_branch ]]; then
    git checkout -b $target_branch
fi

# If the current branch is not the target branch, switch to it
current_branch=$(git symbolic-ref --short HEAD)
if [ $current_branch != $target_branch ]; then
    git checkout $target_branch
fi

pip install -r requirements.txt

# Downgrade pyarrow for cuDF
pip install --force-reinstall pyarrow==19.0.1

# Install Python packages
pip install \
    --extra-index-url=https://pypi.anaconda.org/rapidsai-wheels-nightly/simple \
    "cudf-cu12>=25.8.0a0,<=25.8" "cudf-polars-cu12>=25.8.0a0,<=25.8"

# Setup rust
source "/root/.cargo/env"

cd -
/bin/bash
