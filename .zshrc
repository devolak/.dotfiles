# If not in tmux, start tmux.
# if [[ -z ${TMUX+X}${ZSH_SCRIPT+X}${ZSH_EXECUTION_STRING+X} ]]; then
#   exec tmux
# fi

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.
if [[ ! -e ~/.local/share/zsh/zsh-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/share/zsh/zsh-syntax-highlighting
  zcompile-many ~/.local/share/zsh/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}
fi
if [[ ! -e ~/.local/share/zsh/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.local/share/zsh/zsh-autosuggestions
  zcompile-many ~/.local/share/zsh/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi
if [[ ! -e ~/.local/share/zsh/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/zsh/powerlevel10k
  make -C ~/.local/share/zsh/powerlevel10k pkg
fi
if [[ ! -e ~/.local/share/zsh/zsh-history-substring-search ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ~/.local/share/zsh/zsh-history-substring-search
  zcompile-many ~/.local/share/zsh/zsh-history-substring-search/{zsh-history-substring-search.zsh}
fi
if [[ ! -e ~/.local/share/zsh/fzf-tab ]]; then
  git clone --depth=1 https://github.com/Aloxaf/fzf-tab.git ~/.local/share/zsh/fzf-tab
  zcompile-many ~/.local/share/zsh/fzf-tab/{fzf-tab.zsh}
fi
if [[ ! -e /usr/share/fzf ]]; then
  zcompile-many /usr/share/fzf/{completion.zsh,key-bindings.zsh}
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

####################
# User Configuration
####################

# History Configuration
export HISTFILE=~/.zsh_history
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
source ~/.local/share/zsh/fzf-tab/fzf-tab.zsh
source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/share/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source <(fzf --zsh)
source ~/.local/share/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

# export FZF_BASE=/usr/share/fzf
