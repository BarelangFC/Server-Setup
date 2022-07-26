# Server-Setup
List bash script for BarelangFC server setup
Setup after fresh install Ubuntu 20.04

## 1. Install NVIDIA CUDA and CUDNN
CUDA Version 11.7
Installation

```bash
sh ./scripts/setup-cuda.sh
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

## 2. Install OpenCV

Build OpenCV 4.6.0 from source

```bash
sh scripts/setup-opencv.sh
```

Verify OpenCV installation with Python

```python
import cv2
```

## User administration

### Install remove access with XRDP

```bash
sudo apt install -y xrdp
```

### Allow remote access over SSH

Install OpenSSH-Server

```bash
sudo apt install openssh-server
```

Edit file `/etc/ssh/ssh_config` to give access on specific port.
Uncomment this configuration

```bash
PasswordAuthentication yes
Port 22 # Change to another port to give secure access
```

Restart OpenSSH-Server service

```bash
sudo systemctl restart ssh
```

### Adding new user with SSH and RDP access

Creating new user to server

```bash
sudo useradd -m -s /bin/bash nama-user
sudo passwd nama-user
```

Give access to SSH and RDP

```bash
sudo usermod -aG ssl-cert nama-user
sudo adduser xrdp ssl-cert
sudo systemctl restart xrdp
```
Edit file `/etc/X11/Xwrapper.config`
```bash
allowed_users=anybody
```
Give user root access

```bash
sudo usermod -aG sudo nama-user
```

Give user to access docker

```bash
sudo usermod -aG docker nama-user
```
