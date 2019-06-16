export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
if [[ `uname` == 'Linux' ]]; then
	if [ $(date +'%j') != $(/usr/bin/stat -c '%Sm' --printf='%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
		compinit
	else
		compinit -C
	fi
else
	if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
		compinit
	else
		compinit -C
	fi
fi

# GO
export GOPATH=$HOME/Dev/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
