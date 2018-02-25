#!/bin/bash
# TODO clean up, follow some guidelines
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming

#REPOPATH="$(cd $(dirname $(readlink -f ${(%):-%N})); pwd)"
readonly REPOPATH="$(pwd)"

p_is_osx() {
  [ "$(uname -s)" = Darwin ]
}

p_is_linux() {
  [ "$(uname -s)" = Linux ]
}

# link config files
if [[ ! -e ~/.zshrc ]]; then
  ln -sf $REPOPATH/.zshrc $HOME/.zshrc
fi
if [[ ! -e ~/.zshenv ]]; then
  ln -sf $REPOPATH/.zshenv $HOME/.zshenv
fi
if [[ ! -e ~/.gitconfig ]]; then
  ln -sf $REPOPATH/.gitconfig $HOME/.gitconfig
fi
if [[ ! -e ~/.ctags ]]; then
  ln -sf $REPOPATH/.ctags $HOME/.ctags
fi
if [[ ! -e ~/.tmux.conf ]]; then
  ln -sf $REPOPATH/.tmux.conf $HOME/.tmux.conf
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

