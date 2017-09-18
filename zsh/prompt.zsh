setopt prompt_subst

p_arrow() {
  echo " %F{yellow}»%f"
}

p_git_info() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  local changes=$(git diff-index --name-only HEAD -- 2> /dev/null | head -1)
  if [[ -n $current_branch ]]; then
    if [[ -n $changes ]]; then
      echo "  %F{red}$current_branch%f"
    else
      echo "  %F{green}$current_branch%f"
    fi
  fi
}

p_colored_path() {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

p_envs() {
	local envs
	[[ -n $SSH_CLIENT ]] && envs+="R"

	[[ -n $envs ]] && echo "[$envs]"
}

PROMPT=' %F{blue}λ%f $(p_envs)(%c)$(p_git_info)$(p_arrow) '
