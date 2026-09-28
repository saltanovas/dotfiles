export DOTFILES_ROOT="$HOME/dotfiles"

# less
# -R preserve ANSI colors | -F auto-exit if output fits on screen | -K quit on ctrl+c
export LESS="-RFK --mouse"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

# man
export MANPAGER='sh -c "col -bx | bat -l man --theme \"ansi\""'

# Homebrew
# Update once every 30 days
export HOMEBREW_AUTO_UPDATE_SECS=2592000
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"
case "$(command -v brew 2>/dev/null)" in
    "$HOME"/*)
        export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications" ;;
esac

# Application config
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql/history"
# See: https://tldr.sh/tlrc/#configuration
export TLRC_CONFIG="$XDG_CONFIG_HOME/tlrc/config.toml"

# Karaf
export KARAF_DATA="$XDG_STATE_HOME/karaf"
export KARAF_LOG="$XDG_STATE_HOME/karaf/log"
export KARAF_HISTORY="$XDG_STATE_HOME/karaf/history"
export KARAF_OPTS="-Dkaraf.history=$KARAF_HISTORY"

# Disables Apple Terminal session restoration
export SHELL_SESSIONS_DISABLE=1
