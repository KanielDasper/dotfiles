if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export LANG=en_US.UTF-8
export ZSH="$CONFIG/oh-my-zsh/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export PATH="/Users/danielkasper/.local/share/../bin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/scala@3.3/bin:$PATH"

HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"

alias v="nvim"
alias vi="nvim"
alias ..="cd .."
alias va="source .venv/bin/activate"
alias ls="eza -a --color=always --across --git --icons=always --no-user"
alias tree="eza --tree"

source ~/.local/share/cargo/env
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
