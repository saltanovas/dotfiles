export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Keep Homebrew first for consistent PATH resolution.
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$PATH"
export HOMEBREW_INSTALL_BADGE="🍺"
# eval "$(/opt/homebrew/bin/brew shellenv)"

export JAVA_HOME="/opt/homebrew/Cellar/openjdk/25/libexec/openjdk.jdk/Contents/Home"
# export JAVA_HOME=$(/usr/libexec/java_home -v 24)
export PATH="$PATH:$JAVA_HOME/bin"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PATH:$PYENV_ROOT/bin:$PYENV_ROOT/shims"
# eval "$(pyenv init --path)"

export PIPX_HOME="$XDG_DATA_HOME/pipx"
export PIPX_BIN_DIR="$HOME/.local/bin"
export PATH="$PATH:$PIPX_BIN_DIR"

export PATH="$PATH:$HOME/.orbstack/bin"

export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
