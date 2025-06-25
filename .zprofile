# If Homebrew is installed via /opt/homebrew (Apple Silicon)  If you're using macOS, you'll want this enabled
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set XDG Base Directory variables
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_RUNTIME_DIR="/run/user/${UID}"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Aliases and additional paths for convienience
export CONFIG="$XDG_CONFIG_HOME"
export CACHE="$XDG_CACHE_HOME"
export DATA="$XDG_DATA_HOME"
export STATE="$XDG_STATE_HOME"
export CODE="${HOME}/Code"
export DOC="${HOME}/Documents"

# ~/ Clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export BASHDOTDIR="$XDG_CONFIG_HOME/bash"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export LESSHISTFILE="-"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle/config"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# Default binaries
export EDITOR=nvim
export BAT_THEME="tokyonight_moon"
