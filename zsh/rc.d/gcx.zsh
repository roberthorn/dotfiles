(( $+commands[gcx] )) || return

# Set up completions
_gcx_completion_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
_gcx_completion_file="$_gcx_completion_dir/_gcx"

mkdir -p "$_gcx_completion_dir"
fpath=("$_gcx_completion_dir" $fpath)

if [[ ! -f "$_gcx_completion_file" ]]; then
  gcx completion zsh >| "$_gcx_completion_file"
fi

autoload -Uz _gcx

unset _gcx_completion_dir _gcx_completion_file
