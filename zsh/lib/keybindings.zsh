# emacs keybindings (same as `setopt EMACS`)
bindkey -e

# edit command line via text editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
