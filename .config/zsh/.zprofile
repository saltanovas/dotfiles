export PATH="/opt/homebrew/bin:/opt/homebrew/sbin"
export PATH="$PATH:$HOME/.orbstack/bin"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export JAVA_HOME="/opt/homebrew/Cellar/openjdk/25/libexec/openjdk.jdk/Contents/Home"
# export JAVA_HOME=$(/usr/libexec/java_home -v 25)
export PATH="$PATH:$JAVA_HOME/bin"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PATH:$PYENV_ROOT/bin:$PYENV_ROOT/shims"
# eval "$(pyenv init --path)"

export PIPX_HOME="$XDG_DATA_HOME/pipx"
export PIPX_BIN_DIR="$HOME/.local/bin"
export PATH="$PATH:$PIPX_BIN_DIR"

export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# See https://tldr.sh/tlrc/#configuration
export TLRC_CONFIG="$XDG_CONFIG_HOME/tlrc/config.toml"

export BREWFILE="$XDG_CONFIG_HOME/homebrew/Brewfile"
