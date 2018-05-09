#!/bin/sh

sudo apt-get update -y

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

success_message () {
  printf "$GREEN$1$NC\n"
}

failure_message () {
  printf "$RED$1$NC\n"
}

additional_step_message () {
  printf "$YELLOW$1$NC\n"
}

setup_vim () {
  if [ ! `which vim` ]; then
    additional_step_message "Vim does not exist. Installing..."
    sudo apt-get install -y vim
    success_message "Successfully installed vim"
  fi

  echo 'set -o vim' >> ~/.bashrc
  echo 'export EDITOR=/usr/bin/vim' >> ~/.bashrc

  success_message "Successfully setup vim"
}

setup_bin () {
  echo 'PATH="'$(pwd)/bin':$PATH"' >> ~/.bashrc
}

setup_bin

setup_vim

sudo apt-get install -y python3-pip
pip3 install awscli

cat vim-configs/.vimrc >> ~/.vimrc
