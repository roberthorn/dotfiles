export ZDOTDIR=${ZDOTDIR:-~/.config/zsh}

skip_global_compinit=1

# screw path_helper
# https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
setopt noglobalrcs

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-~/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-~/.xdg}

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# remove duplicates from *paths
typeset -gU cdpath fpath mailpath path

path=(
  ~/bin
  /usr/local/{bin,sbin}
  /opt/homebrew/{bin,sbin}
  $path
)
