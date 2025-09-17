export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/.local/bin:$PATH"

# A bit heavy to run on every shell start,
#  consider using internal jswitch function isntead inside the install.sh
# or just simply hardcode the PATH 
# export PATH="/opt/homebrew/opt/openjdk@24/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 24)
export PATH=$JAVA_HOME/bin:$PATH

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
# eval "$(pyenv init --path)"

export PIPX_HOME="$XDG_DATA_HOME/pipx"
export PIPX_BIN_DIR="$HOME/.local/bin"
export PATH="$PATH:$PIPX_BIN_DIR"

export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"