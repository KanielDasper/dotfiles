if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


plugins=(zsh-syntax-highlighting)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

ZSH_THEME="gentoo"
autoload -zU zmv compinit

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias vi="nvim"
alias ls="ls -alh --color=always"
alias ..="cd .."
alias va="source .venv/bin/activate"
alias book="bookokrat"

source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
