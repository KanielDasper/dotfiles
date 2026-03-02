zmodload zsh/complist
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U colors && colors 

zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes false 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

setopt append_history inc_append_history share_history 
setopt auto_menu menu_complete
setopt autocd 
setopt auto_param_slash
setopt no_case_glob no_case_match
setopt globdots 
setopt extended_glob 
setopt emacs

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" 
HISTCONTROL=ignoreboth

bindkey '^[[Z' reverse-menu-complete
bindkey "^n" history-search-forward
bindkey "^p" history-search-backward

alias v="nvim"
alias vi="nvim"
alias ls="ls -alh --color=always"
alias ..="cd .."
alias va="source .venv/bin/activate"

NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{#3b4252} %F{#ECEFF4}%n@%m %f%k %~ ❯ "

source "/opt/homebrew/Cellar/zsh-syntax-highlighting/0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
