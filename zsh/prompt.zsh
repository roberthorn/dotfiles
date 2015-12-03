setopt prompt_subst

p_arrow() {
  echo " %F{yellow}»%f"
}

p_git_info() {
  current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %F{green}$current_branch%f"
  fi
}

p_colored_path() {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

PROMPT=' %F{blue}λ%f $(p_colored_path)$(p_git_info)$(p_arrow) '
