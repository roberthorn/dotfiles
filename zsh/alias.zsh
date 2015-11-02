alias vi=vim
alias gi='go install'
alias gir='go install && `basename $PWD`'
alias squash='git fetch origin && git rebase -i HEAD~`git cherry -v origin/master | wc -l | tr -d " "`'
alias gidoctor='go install golang-refactoring.org/go-doctor/cmd/godoctor'

alias ls='ls --color'

