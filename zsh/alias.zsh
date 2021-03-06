# meh
alias ni=nvim
alias vim=nvim
if [[ `uname` == 'Linux' ]]; then
	alias ls='ls -G --color'
else
	alias ls='ls -G'
fi

alias ll='ls -la'

alias r='ranger'

alias wiki="vim ~/vimwiki/index.wiki"
alias notes="vim ~/.notes"

alias pang='ping -c 3 www.google.com'

# git
alias squash='git fetch origin && git rebase -i HEAD~`git cherry -v origin/master | wc -l | tr -d " "`'

# go shhtuff
alias gi='go install'
alias gir='go install && `basename $PWD`'

# rustup
#alias rustup='curl -sSf https://static.rust-lang.org/rustup.sh | sh'


