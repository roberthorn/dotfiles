# ls colors
autoload -U colors && colors

if [[ "$OSTYPE" == (darwin)* ]]; then
  ls -G . &>/dev/null && alias ls='ls -G'
fi
