# meh
alias vi=vim
alias vim=nvim
alias ls='ls -G'

# git
alias squash='git fetch origin && git rebase -i HEAD~`git cherry -v origin/master | wc -l | tr -d " "`'

# go shhtuff
alias gi='go install'
alias gir='go install && `basename $PWD`'



