# If not in tmux, start tmux.
# if [[ -z ${TMUX+X}${ZSH_SCRIPT+X}${ZSH_EXECUTION_STRING+X} ]]; then
#   exec tmux
# fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -d $XDG_DATA_HOME/antidote ]]; then
  git clone https://github.com/mattmc3/antidote $XDG_DATA_HOME/antidote
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#ZSH_AUTOSUGGEST_MANUAL_REBIND=1

zstyle ':antidote:bundle' use-friendly-names 'yes'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

source $XDG_DATA_HOME/antidote/antidote.zsh

[[ ! -f /usr/bin/fzf ]] || source <(fzf --zsh)
antidote load

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE

set -o emacs

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^H' backward-kill-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

alias ls="ls -h --color --group-directories-first"
alias grep="grep --color=auto"
alias rmpkg="sudo pacman -Rsn"
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
