export ASDF_DIRENV_BIN="/opt/homebrew/bin/direnv"
eval "$($ASDF_DIRENV_BIN hook zsh)"

# set GOROOT
[[ -e ~/.asdf/plugins/golang/set-env.zsh ]] && source ~/.asdf/plugins/golang/set-env.zsh
