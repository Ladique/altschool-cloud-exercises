#!/bin/bash

echo "Enter a username (no uppercase letter)"

read name

sudo adduser $name 

if ! grep -q  "^developers:" /etc/group; then
   echo "Developers group wasn't found. Creating it now"
   sudo groupadd developers
fi

sudo usermod -aG developers $name

sudo touch /home/$name/log_file.log

sudo chmod 600 /home/$name/log_file.log

sudo chown $name:$name /home/$name/log_file.log
