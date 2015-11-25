setopt prompt_subst

function p_arrow {
  echo " %F{yellow}»%f"
}

function git_info {
  current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %F{green}$current_branch%f"
  fi
}

function p_colored_path {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

PROMPT=' %F{blue}λ%f $(p_colored_path)$(git_info)$(p_arrow) '
