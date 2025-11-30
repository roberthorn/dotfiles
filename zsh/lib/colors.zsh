# ls colors
autoload -U colors && colors

if [[ "$OSTYPE" == (darwin)* ]]; then
  ls -G . &>/dev/null && alias ls='ls -G'
fi

[[ -x "$(command -v lsd)" ]] && alias ls='lsd --group-directories-first'
