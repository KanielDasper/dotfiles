# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh-my-zsh stuff
export ZSH="$CONFIG/oh-my-zsh/.oh-my-zsh"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
HIST_STAMPS="yyyy-mm-dd"
plugins=(
	git 
	zsh-autosuggestions 
	zsh-syntax-highlighting
	python 
)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# Aliases
alias vi=nvim
alias v=nvim
alias ..="cd .."
alias dockspace="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}' && killall Dock"
alias fzfman='compgen -c | fzf'
alias y="yazi"
alias ls="eza -a --color=always --across --git --icons=always --no-user"

# Set neovim as manpager
export MANPAGER='nvim +Man!'

# Add fzf keybindings and fuzzy completion
eval "$(fzf --zsh)"
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Yazi wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
