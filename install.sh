#!/bin/bash
# TODO install zsh
# TODO install git
# TODO install vim/nvim
# TODO clean up, follow some guidelines
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming

#REPOPATH="$(cd $(dirname $(readlink -f ${(%):-%N})); pwd)"
readonly REPOPATH="$(pwd)"

# link config files
if [[ ! -e ~/.zshrc ]]; then
  ln -sf $REPOPATH/.zshrc ~/.zshrc
fi
if [[ ! -e ~/.gitconfig ]]; then
  ln -sf $REPOPATH/.gitconfig ~/.gitconfig
fi

# neovim configuration
if [[ ! -d ~/.nvim ]]; then
  mkdir ~/.nvim
  mkdir ~/.nvim/autoload
  mkdir ~/.nvim/bundle
  mkdir ~/.nvim/colors

  curl -fLo ~/.nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ln -sf ~/.nvim/ ~/.config/nvim
fi
ln -sf $REPOPATH/nvim/init.vim ~/.nvim/init.vim

