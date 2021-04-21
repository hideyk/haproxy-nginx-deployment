#!/bin/bash
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done
sudo apt update && sudo apt upgrade -y
sudo apt install ansible -y

mkdir /home/ubuntu/alation