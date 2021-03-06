# git repo
# readonly REPOPATH="$(cd $(dirname $(readlink -f ${(%):-%N})); pwd)"
readonly REPOPATH=$HOME/.dotfiles

# history
setopt hist_ignore_space
setopt append_history
setopt hist_ignore_dups
setopt share_history
setopt extendedglob

# antigen
if [[ ! -d $REPOPATH/zsh/antigen ]]; then
  git clone https://github.com/zsh-users/antigen.git $REPOPATH/zsh/antigen
fi

source $REPOPATH/zsh/antigen/antigen.zsh

antigen bundles <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions src
EOBUNDLES

antigen apply

# sources
sources=(
  'alias'
  'completions'
  'editor'
  'prompt'
)

for src in $sources; do
  source $REPOPATH/zsh/$src.zsh
done

if [[ -e ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

