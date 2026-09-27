PROMPT=$'%F{%(#.blue.green)}┌──(%B%F{%(#.red.blue)}%n@%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
RPROMPT=$'%(?.. %? %F{red}%Bx%b%F{reset})%(1j. %j %F{yellow}%Bbg %b%F{reset}.)'

source "$XDG_CONFIG_HOME/shell/alias"
source "$XDG_CONFIG_HOME/shell/functions.sh"
eval "$(mise activate zsh)"

# ------------------------------------------------------------------------------
# History
# ------------------------------------------------------------------------------
# More: https://unix.stackexchange.com/a/273863
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000000              # Number of commands kept in memory during the current shell session
SAVEHIST=100000               # Number of commands written to the history file
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.

# ------------------------------------------------------------------------------
# Completion
# ------------------------------------------------------------------------------
ZCOMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"
# Init zsh completion
fpath=(
    /opt/homebrew/share/zsh/site-functions
    /Applications/OrbStack.app/Contents/Resources/completions/zsh
    $fpath
)
zmodload zsh/complist
autoload -Uz compinit
compinit -i -d "$ZCOMPDUMP"

# Configure completion matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu no
# Include hidden entries only when generating completion candidates
_comp_options+=(globdots)

# Add fzf-based completion and previews
source /opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh
zstyle ':fzf-tab:complete:cd:*' fzf-preview "${aliases[ll]} -- \$realpath"
zstyle ':fzf-tab:*' continuous-trigger enter
# Ensure colors match by using FZF_DEFAULT_OPTS.
zstyle ":fzf-tab:*" use-ff-default-opts yes
eval "$(fzf --zsh)"

# Add inline suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Apply personal line-editor bindings
bindkey -e
# Make the Escape binding respond quickly while still allowing Alt/Option keys
KEYTIMEOUT=3
source "$ZDOTDIR/zle-keybindings.zsh"
