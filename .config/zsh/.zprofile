export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/opt/homebrew/bin:$HOME/opt/homebrew/sbin"
export PATH="$PATH:$HOME/.orbstack/bin"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export ZCOMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"

# -R      preserve ANSI colors (bat, git, grep, etc.)
# -F      auto-exit if output fits on one screen
# -K      quit immediately on ctrl+c
export LESS="-RFK --mouse"
export MANPAGER='sh -c "col -bx | bat -l man --theme \"ansi\""'

# Update once every 30 days
export HOMEBREW_AUTO_UPDATE_SECS=2592000
export HOMEBREW_UPGRADE_GREEDY=1
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"

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

export DOTFILES_ROOT="$HOME/dotfiles"
# See: https://tldr.sh/tlrc/#configuration
export TLRC_CONFIG="$XDG_CONFIG_HOME/tlrc/config.toml"
