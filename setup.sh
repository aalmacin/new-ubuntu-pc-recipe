#!/bin/sh

echo 'set -o vi' >> ~/.bashrc
echo 'export EDITOR=/usr/bin/vim' >> ~/.bashrc

sudo apt-get update -y
sudo apt-get install -y python3-pip
pip3 install awscli
