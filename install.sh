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
if [[ ! -e ~/.tmux.conf ]]; then
  ln -sf $REPOPATH/.tmux.conf $HOME/.tmux.conf
fi

# neovim configuration
rm -rf ~/.config/nvim
cp -r ./nvim ~/.config/nvim

# run :PackerSync
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
