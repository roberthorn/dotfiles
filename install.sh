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
  ln -sf $REPOPATH/.zshrc $ZDOTDIR/.zshrc
fi
if [[ ! -e ~/.zshenv ]]; then
  ln -sf $REPOPATH/.zshenv $ZDOTDIR/.zshenv
fi
if [[ ! -e ~/.gitconfig ]]; then
  ln -sf $REPOPATH/.gitconfig $HOME/.gitconfig
fi
if [[ ! -e ~/.tmux.conf ]]; then
  ln -sf $REPOPATH/.tmux.conf $XDG_CONFIG_HOME/tmux/.tmux.conf
fi

# neovim configuration
rm -rf $XDG_CONFIG_HOME/nvim
cp -r ./nvim $XDG_CONFIG_HOME/nvim

# run :PackerSync
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
