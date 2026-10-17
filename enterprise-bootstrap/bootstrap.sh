#!/bin/bash

sudo apt update
sudo apt install -y nginx

if ! id "employee" &>/dev/null; then
   sudo useradd -m employee
fi

if ! grep -q "^team:" /etc/group; then
   sudo groupadd team
fi

sudo usermod -aG team employee

if [ ! -f  disk.img ]; then
   sudo fallocate -l 100M disk.img
   sudo mkfs.ext4 disk.img
fi

sudo mkdir -p /mnt/fakedisk

if ! mountpoint -q /mnt/fakedisk; then
   sudo mount disk.img /mnt/fakedisk
fi

sudo chown employee:team /mnt/fakedisk
sudo chmod 700 /mnt/fakedisk

