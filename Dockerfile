FROM nvidia/cuda:12.8.1-runtime-ubuntu24.04

RUN <<EOF
apt update
apt install -y python3.12 python3.12-venv pip
apt install -y sudo
apt install -y curl
apt install -y make gcc git
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
EOF