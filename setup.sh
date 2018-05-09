#!/bin/sh

sudo apt-get update -y

setup_vim () {
  
  check_and_install 'vim'

  echo 'set -o vi' >> ~/.bashrc
  echo 'export EDITOR=/usr/bin/vim' >> ~/.bashrc

  cat vim-configs/.vimrc >> ~/.vimrc

  success_message "Successfully setup vim"
}

setup_bin () {
  BIN_PATH=$(pwd)/bin
  echo 'PATH="'$BIN_PATH':$PATH"' >> ~/.bashrc
  sudo chmod +x $BIN_PATH/*
  success_message "Successfully setup bin"
}

setup_pip () {
  sudo apt-get install -y python3-pip
  pip3 install awscli
}

setup_bin
setup_vim
setup_pip
