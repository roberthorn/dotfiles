#!/bin/bash
# TODO install zsh
# TODO install git
# TODO install vim/nvim

#REPOPATH="$(cd $(dirname $(readlink -f ${(%):-%N})); pwd)"
REPOPATH="$(pwd)"

if [[ ! -e ~/.zshrc ]]; then
  ln -sf $REPOPATH/.zshrc ~/.zshrc
fi
if [[ ! -e ~/.gitconfig ]]; then
  ln -sf $REPOPATH/.gitconfig ~/.gitconfig
fi

# vim
if [[ ! -d ~/.vim ]]; then
  mkdir ~/.vim
  mkdir ~/.vim/autoload
  mkdir ~/.vim/bundle
  mkdir ~/.vim/colors
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
if [[ ! -e ~/.vimrc ]]; then
  ln -sf $REPOPATH/.vimrc ~/.vimrc
fi

# neovim
if [[ ! -d ~/.nvim ]]; then
  mkdir ~/.nvim
  mkdir ~/.nvim/autoload
  mkdir ~/.nvim/bundle
  mkdir ~/.nvim/colors
  curl -LSso ~/.nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  curl -fLo ~/.nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ln -sf ~/.config/nvim/ ~/.nvim
fi
ln -sf $REPOPATH/nvim/init.vim ~/.nvim/init.vim

