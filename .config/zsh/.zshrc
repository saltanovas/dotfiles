PROMPT=$'%F{%(#.blue.#739B57)}╭──(%B%F{%(#.red.blue)}%n@%m%b%F{%(#.blue.#739B57)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.#739B57)}]\n╰─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
RPROMPT=$'%(?.. %? %F{red}%Bx%b%F{reset})%(1j. %j %F{yellow}%Bbg %b%F{reset}.)'
cd "$HOME/$(iswrk >/dev/null && printf w || printf p)"

setopt autocd cd_silent    # change directory just by typing its name
cdpath=("." ".." "$HOME" "$HOME/Desktop" "$HOME/p" "$HOME/w") # search order for relative directory names
setopt correct             # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
disable r

source "$XDG_CONFIG_HOME/shell/aliases.sh"
source "$XDG_CONFIG_HOME/shell/functions.sh"

# ------------------------------------------------------------------------------
# History
# ------------------------------------------------------------------------------
# More: https://unix.stackexchange.com/a/273863
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=1000000       # Number of commands kept in memory during the current shell session
export SAVEHIST=100000        # Number of commands written to the history file
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
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
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

# Add inline suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-you-should-use/you-should-use.plugin.zsh

# Apply personal line-editor bindings
bindkey -e
# Make the Escape binding respond quickly while still allowing Alt/Option keys
KEYTIMEOUT=3
source "$ZDOTDIR/zle-keybindings.zsh"

eval "$(fzf --zsh)"
eval "$(mise activate zsh)"
eval "$(tv init zsh)"
