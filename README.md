# Server-Setup
List bash script for BarelangFC server setup
Setup after fresh install Ubuntu 20.04

## 1. Install NVIDIA CUDA
CUDA Version 11.7
Installation

```bash
sh ./scripts/install-cuda.sh
```

Edit .bashrc script then add this export cuda path command to the end of line

```bash
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
```

Verify driver installation

```bash
nvidia-smi
```

The output should be

```
Sun Jul 17 14:20:35 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 515.43.04    Driver Version: 515.43.04    CUDA Version: 11.7     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  On   | 00000000:01:00.0 Off |                  N/A |
|  0%   36C    P8     7W / 198W |    218MiB /  8192MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      1157      G   /usr/lib/xorg/Xorg                 23MiB |
|    0   N/A  N/A      4239      G   /usr/lib/xorg/Xorg                146MiB |
|    0   N/A  N/A      4405      G   /usr/bin/gnome-shell               10MiB |
|    0   N/A  N/A     27359      G   ...074389336890622603,131072       27MiB |
+-----------------------------------------------------------------------------+
```

Verify nvidia cuda compiler 

```bash
nvcc -V
```

The output should be

```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2022 NVIDIA Corporation
Built on Tue_May__3_18:49:52_PDT_2022
Cuda compilation tools, release 11.7, V11.7.64
Build cuda_11.7.r11.7/compiler.31294372_0
```
