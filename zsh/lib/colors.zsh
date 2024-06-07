# ls colors
autoload -U colors && colors

if [[ "$OSTYPE" == (darwin)* ]]; then
  ls -G . &>/dev/null && alias ls='ls -G'
fi

[[ -x "$(command -v eza)" ]] && alias ls='eza -l --group-directories-first --icons'
