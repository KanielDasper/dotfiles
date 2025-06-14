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
	zsh-autosuggestions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# Aliases
alias vi="nvim"
alias v="nvim"
alias :q="exit"
alias ..="cd .."
alias va="source .venv/bin/activate"
alias lg="lazygit"
alias dockspace="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}' && killall Dock"
alias fzfman='compgen -c | fzf'
alias ls="eza -a --color=always --across --git --icons=always --no-user"
alias globalip="curl http://ipecho.net/plain; echo"

# Set neovim as manpager
export MANPAGER='nvim +Man!'
export GIT_PAGER='nvim +Man!'

# Edit and source with ze
function ze() {
  local zrc="$CONFIG/zsh/.zshrc"
  local tmp="$(mktemp)"

  sha256sum "$zrc" > "$tmp"

  nvim "$zrc"

  if ! sha256sum --check --status "$tmp"; then
    echo "Changes detected. Reloading..."
    source "$zrc"
  fi

  rm -f "$tmp"
}

# Fzf options
export FZF_DEFAULT_OPTS="
    --layout reverse
    --style minimal
    --height 100%
    --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
    --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview '[[ -d {} ]] && tree -aC {} || bat --style=numbers --color=always {}'
  --bind 'enter:execute(nvim {+})+abort'
  --bind 'ctrl-y:accept'
"

eval "$(fzf --zsh)"

source ~/.zprofile
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
