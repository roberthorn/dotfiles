# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# since we use `setopt noglobalrcs` in zshenv, we need to manually source /etc/zshrc
source /etc/zshrc

setopt EXTENDEDGLOB

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# load lib files
lib_dir=${ZDOTDIR:-~/.config/zsh}/lib
if [[ -d "$lib_dir" ]]; then
  for file in $lib_dir/*.zsh; do
	source $file
  done
fi
unset lib_dir

[[ -e ~/.zshrc.local ]] && source ~/.zshrc.local

# compinit
autoload -Uz compinit
if [[ "$OSTYPE" == (darwin)* ]]; then
  if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
    compinit;
  else
    compinit -C;
  fi
fi

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
