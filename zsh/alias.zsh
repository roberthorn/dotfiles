# meh
alias ni=nvim
alias vim=nvim
alias ls='ls -G'
alias ll='ls -la'

alias tmux="TERM=screen-256color-bce tmux"

alias pang='ping -c 3 www.google.com'

# git
alias squash='git fetch origin && git rebase -i HEAD~`git cherry -v origin/master | wc -l | tr -d " "`'

# go shhtuff
alias gi='go install'
alias gir='go install && `basename $PWD`'

# rustup
alias rustup='curl -sSf https://static.rust-lang.org/rustup.sh | sh'


