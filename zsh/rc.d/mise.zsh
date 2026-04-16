(( $+commands[mise] )) || return

eval "$(mise activate zsh)"

# Set up completions
_mise_completion_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
_mise_completion_file="$_mise_completion_dir/_mise"

mkdir -p "$_mise_completion_dir"
fpath=("$_mise_completion_dir" $fpath)

if [[ ! -f "$_mise_completion_file" ]]; then
  mise completion zsh >| "$_mise_completion_file"
fi

autoload -Uz _mise

unset _mise_completion_dir _mise_completion_file
