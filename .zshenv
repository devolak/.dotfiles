export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

export HISTFILE="$XDG_CACHE_HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

export EDITOR="/usr/bin/nvim"
