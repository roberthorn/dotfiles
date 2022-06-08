export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

fpath=(~/.zsh/completion $fpath)
# autoload -Uz compinit
# if [[ `uname` == 'Linux' ]]; then
# 	if [ $(date +'%j') != $(/usr/bin/stat -c '%Sm' --printf='%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
# 		compinit
# 	else
# 		compinit -C
# 	fi
# else
# 	if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
# 		compinit
# 	else
# 		compinit -C
# 	fi
# fi

# GO
export GOPATH=$HOME/Dev/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# NVM
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  --no-use # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##### nvm (node version manager) #####
# placeholder nvm shell function
# On first use, it will set nvm up properly which will replace the `nvm`
# shell function with the real one
nvm() {
  if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  --no-use # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    if [[ -e ~/.nvm/alias/default ]]; then
      export PATH="${PATH}:${HOME}.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
    fi
    # invoke the real nvm function now
    nvm "$@"
  else
    echo "nvm is not installed" >&2
    return 1
  fi
}
