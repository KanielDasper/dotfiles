fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

zmodload zsh/complist
autoload -Uz compinit && compinit

HISTFILE="$XDG_CACHE_HOME/zsh_history" 
HISTSIZE=5000
SAVEHIST=5000
HISTUP=erase
PS1='%n@%m:%~$ '

setopt emacs

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

source "/opt/homebrew/Cellar/zsh-syntax-highlighting/0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

export MYWIKI="~/Documents/vault/nvimwiki/main_index.txt"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
