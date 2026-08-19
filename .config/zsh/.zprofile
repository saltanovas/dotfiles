export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/opt/homebrew/bin:$HOME/opt/homebrew/sbin"
export PATH="$PATH:$HOME/.orbstack/bin"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# -R preserve ANSI colors | -F auto-exit if output fits on screen | -K quit on ctrl+c
export LESS="-RFK --mouse"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

export MANPAGER='sh -c "col -bx | bat -l man --theme \"ansi\""'

# Update once every 30 days
export HOMEBREW_AUTO_UPDATE_SECS=2592000
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"
if [[ "$(command -v brew 2>/dev/null)" == "$HOME"* ]]; then
    export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
fi

export DOTFILES_ROOT="$HOME/dotfiles"
# See: https://tldr.sh/tlrc/#configuration
export TLRC_CONFIG="$XDG_CONFIG_HOME/tlrc/config.toml"

export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql/history"

export KARAF_DATA="$XDG_STATE_HOME/karaf"
export KARAF_LOG="$XDG_STATE_HOME/karaf/log"
export KARAF_OPTS="-Dkaraf.history=$XDG_STATE_HOME/karaf/history"

# Disables Apple Terminal session restoration
export SHELL_SESSIONS_DISABLE=1