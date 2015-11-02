setopt prompt_subst

function p_arrow {
  echo "%F{yellow}»%f"
}

function p_colored_path {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

PROMPT=' %F{blue}λ%f $(p_colored_path) $(p_arrow) '
