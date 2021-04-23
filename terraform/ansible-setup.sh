#!/bin/bash
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done
sudo apt update && sudo apt upgrade -y
sudo apt install ansible -y
sudo ansible-galaxy collection install nginxinc.nginx_core

mkdir /home/ubuntu/alation