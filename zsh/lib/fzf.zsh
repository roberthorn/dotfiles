export FZF_DEFAULT_COMMAND="fd --type file --hidden --no-ignore"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

export FZF_CTRL_T_OPTS=" \
--preview 'bat -n --color=always {}' \
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
