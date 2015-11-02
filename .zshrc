REPOPATH="$(cd $(dirname $(readlink -f ${(%):-%N})); pwd)"

sources=(
  'alias'
  'path'
  'prompt'
)

for src in $sources; do
  source $REPOPATH/zsh/$src.zsh
done

if [[ -e ~/.zsh.local ]]; then
  source ~/.zsh.local
fi

