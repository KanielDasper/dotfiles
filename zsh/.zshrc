fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

autoload -U compinit && compinit

SAVEHIST=5000
HISTFILE="$XDG_CACHE_HOME/zsh_history" 
HISTUP=erase

alias ls="ls -l --color=always"
zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes false 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export MYWIKI="~/Documents/vault/nvimwiki/main_index.txt"
source "/opt/homebrew/Cellar/zsh-syntax-highlighting/0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
