if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export EDITOR='nvim'
export MANPAGER='nvim +Man!'

# Set XDG Base Directory variables
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# ENV vars
export CONFIG="$XDG_CONFIG_HOME"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker 
export DOCKER_HOST=unix://$HOME/.config/colima/default/docker.sock

# $HOME clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgreprc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"

# PATH
export PATH="/Users/danielkasper/.local/bin:$PATH"
source ~/.local/share/cargo/env
