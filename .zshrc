# If not in tmux, start tmux.
# if [[ -z ${TMUX+X}${ZSH_SCRIPT+X}${ZSH_EXECUTION_STRING+X} ]]; then
#   exec tmux
# fi

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.
function () {
  local data="${XDG_DATA_HOME:-$HOME/.local/share}/zsh"

  if [[ ! -e "$data/zsh-syntax-highlighting" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$data/zsh-syntax-highlighting"
    zcompile-many "$data/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}"
  fi
  if [[ ! -e "$data/zsh-autosuggestions" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$data/zsh-autosuggestions"
    zcompile-many "$data/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}"
  fi
  if [[ ! -e "$data/powerlevel10k" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$data/powerlevel10k"
    make -C "$data/powerlevel10k" pkg
  fi
  if [[ ! -e "$data/zsh-history-substring-search" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git "$data/zsh-history-substring-search"
    zcompile-many "$data/zsh-history-substring-search/{zsh-history-substring-search.zsh}"
  fi
  if [[ ! -e "$data/fzf-tab" ]]; then
    git clone --depth=1 https://github.com/Aloxaf/fzf-tab.git "$data/fzf-tab"
    zcompile-many "$data/fzf-tab/fzf-tab.zsh"
  fi

  # Activate Powerlevel10k Instant Prompt.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # Enable the "new" completion system (compsys).
  autoload -Uz compinit && compinit
  [[ "$HOME/.zcompdump.zwc" -nt "$HOME/.zcompdump" ]] || zcompile-many "$HOME/.zcompdump"
  unfunction zcompile-many
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

####################
# User Configuration
####################

# History Configuration
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Use custom less colors for man pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# Plugin Configuration
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export FZF_CTRL_R_OPTS="--layout reverse"

# Binds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^H' backward-kill-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

#######################
# Environment Variables
#######################

export EDITOR="/usr/bin/nvim"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Load plugins.
function () {
  local data="${XDG_DATA_HOME:-$HOME/.local/share}/zsh"

  source $data/powerlevel10k/powerlevel10k.zsh-theme
  [[ ! -f /usr/bin/fzf ]] || source <(fzf --zsh)
  source $data/fzf-tab/fzf-tab.zsh
  source $data/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $data/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $data/zsh-history-substring-search/zsh-history-substring-search.zsh
  [[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
}
