# VLLM

## Installation
```bash
git clone git@github.com:vllm-project/vllm.git
cd vllm
sudo apt install python3-pip
python3.12 -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install uv numpy
uv pip install --editable .
```
 `VLLM_USE_PRECOMPILED=1 uv pip install --editable .` gives an error on the following setup

 ```
 mac_local@computeinstance-e00g4jz1npgswkx90y:~/vllm$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2025 NVIDIA Corporation
Built on Fri_Feb_21_20:23:50_PST_2025
Cuda compilation tools, release 12.8, V12.8.93
Build cuda_12.8.r12.8/compiler.35583870_0
```

Running on 1xH100
