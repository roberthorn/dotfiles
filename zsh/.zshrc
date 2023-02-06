# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

typeset -gU cdpath fpath mailpath path

path=(
  ~/bin
  /usr/local/{bin,sbin}
  /opt/homebrew/{bin,sbin}
  $path
)

export PATH

setopt hist_ignore_space
setopt append_history
setopt hist_ignore_dups
setopt share_history
setopt extendedglob

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh

zplug "themes/garyblessington", from:oh-my-zsh, as:theme

zplug "${ZDOTDIR:-~/.config/zsh}/lib/", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
