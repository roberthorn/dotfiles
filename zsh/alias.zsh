# meh
alias vi=vim
alias vim=nvim
alias ls='ls -G'
alias ll='ls -la'

# git
alias squash='git fetch origin && git rebase -i HEAD~`git cherry -v origin/master | wc -l | tr -d " "`'

# go shhtuff
alias gi='go install'
alias gir='go install && `basename $PWD`'

# rustup
alias rustup='curl -sSf https://static.rust-lang.org/rustup.sh | sh'


