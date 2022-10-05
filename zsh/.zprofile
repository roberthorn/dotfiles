typeset -gU cdpath fpath mailpath path

path=(
  ~/bin
  /usr/local/{bin,sbin}
  /opt/homebrew/{bin,sbin}
  $path
)

export PATH
