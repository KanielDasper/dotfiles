# If Homebrew is installed via /opt/homebrew (Apple Silicon)  If you're using macOS, you'll want this enabled
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set XDG Base Directory variables
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Aliases and additional paths for convienience
export CONFIG="$XDG_CONFIG_HOME"
export CACHE="$XDG_CACHE_HOME"
export DATA="$XDG_DATA_HOME"
export STATE="$XDG_STATE_HOME"

# ~/ Clean-up
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export BASHDOTDIR="$XDG_CONFIG_HOME/bash"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"

# Interactive
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export GIT_PAGER='nvim +Man!'
export BAT_THEME="tokyonight_moon"
export DOCKER_HOST=unix://$HOME/.config/colima/default/docker.sock
