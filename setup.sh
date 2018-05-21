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

setup_colors() {
  # export LSCOLORS=GxFxCxDxBxegedabagaced
  # Chosed Darkside color scheme
  echo "export CLICOLOR=1" >> ~/.bash_profile
  echo "export PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]\[\033[00m\]:\[\033[01;37m\]\w\[\033[00m\]\$ '" >> ~/.bash_profile
}

setup_bin
setup_vim
setup_pip
setup_colors
