# emacs keybindings
bindkey -e

# edit command line
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
