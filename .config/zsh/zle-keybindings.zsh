# Select from the current position to the beginning of the line
_select_to_beginning() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle beginning-of-line
    REGION_ACTIVE=1
}
zle -N select-to-beginning _select_to_beginning


# Select from the current position to the end of the line
_select_to_end() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle end-of-line
    REGION_ACTIVE=1
}
zle -N select-to-end _select_to_end


# Copy the active selection to the macOS clipboard
# The selection remains active after copying
_copy_selection() {
    (( REGION_ACTIVE )) || return

    local start=$MARK
    local end=$CURSOR
    local tmp

    if (( start > end )); then
        tmp=$start
        start=$end
        end=$tmp
    fi

    (( start == end )) && return

    printf '%s' "${BUFFER[$(( start + 1 )),$end]}" | pbcopy
    zle -R
}
zle -N copy-selection _copy_selection


_cut_selection() {
    (( REGION_ACTIVE )) || return

    # Delete the selected region and place it in Zsh's kill buffer
    zle kill-region

    # Copy the deleted text to the macOS clipboard
    printf '%s' "$CUTBUFFER" | pbcopy

    REGION_ACTIVE=0
}
zle -N cut-selection _cut_selection


# Collapse an active selection to its left edge
# Otherwise, move one character left
_selection_left() {
    if (( REGION_ACTIVE )); then
        (( CURSOR = CURSOR < MARK ? CURSOR : MARK ))
        REGION_ACTIVE=0
    else
        zle backward-char
    fi
}
zle -N selection-left _selection_left


# Collapse an active selection to its right edge
# Otherwise, move one character right
_selection_right() {
    if (( REGION_ACTIVE )); then
        (( CURSOR = CURSOR > MARK ? CURSOR : MARK ))
        REGION_ACTIVE=0
    else
        zle forward-char
    fi
}
zle -N selection-right _selection_right

# Shift+Left: extend selection one character left
_select_char_left() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle backward-char
    REGION_ACTIVE=1
}
zle -N select-char-left _select_char_left


# Shift+Right: extend selection one character right
_select_char_right() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle forward-char
    REGION_ACTIVE=1
}
zle -N select-char-right _select_char_right


# Option+Shift+Left: extend selection one word left
_select_word_left() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle backward-word
    REGION_ACTIVE=1
}
zle -N select-word-left _select_word_left


# Option+Shift+Right: extend selection one word right
_select_word_right() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle forward-word
    REGION_ACTIVE=1
}
zle -N select-word-right _select_word_right


# Backspace: delete the selection, otherwise delete the previous character
_selection_backspace() {
    if (( REGION_ACTIVE )); then
        zle kill-region
        REGION_ACTIVE=0
    else
        zle backward-delete-char
    fi
}
zle -N selection-backspace _selection_backspace


# Tab: accept inline suggestion, otherwise run normal completion
_tab_or_complete() {
    if [[ -n $POSTDISPLAY ]]; then
        zle autosuggest-accept
    else
        zle menu-select
    fi
}
zle -N _tab_or_complete

# Shift-Tab: clear inline suggestion, otherwise start reverse completion
_shift_tab_or_reverse_complete() {
  if [[ -n $POSTDISPLAY ]]; then
    zle autosuggest-clear
  else
    zle reverse-menu-complete
  fi
}
zle -N _shift_tab_or_reverse_complete


# Delete/Fn+Backspace: delete the selection, otherwise delete the next character
_selection_delete() {
    if (( REGION_ACTIVE )); then
        zle kill-region
        REGION_ACTIVE=0
    else
        zle delete-char
    fi
}
zle -N selection-delete _selection_delete


# Command+Up: move to the beginning of the entire multiline buffer
_move_to_buffer_beginning() {
    CURSOR=0
    REGION_ACTIVE=0
}
zle -N move-to-buffer-beginning _move_to_buffer_beginning


# Command+Down: move to the end of the entire multiline buffer
_move_to_buffer_end() {
    CURSOR=${#BUFFER}
    REGION_ACTIVE=0
}
zle -N move-to-buffer-end _move_to_buffer_end


# Command+Shift+Up: select to the beginning of the entire buffer
_select_to_buffer_beginning() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    CURSOR=0
    REGION_ACTIVE=1
}
zle -N select-to-buffer-beginning _select_to_buffer_beginning


# Command+Shift+Down: select to the end of the entire buffer
_select_to_buffer_end() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    CURSOR=${#BUFFER}
    REGION_ACTIVE=1
}
zle -N select-to-buffer-end _select_to_buffer_end


# ---------------------------------------------------------------------------
# Cursor shape
#
# Use a beam while selecting so the block cursor does not visually obscure
# the first character or resemble an extra selected space
# ---------------------------------------------------------------------------

autoload -Uz add-zle-hook-widget

typeset -g _zle_cursor_state=''

_update_zle_cursor() {
    local desired

    if (( REGION_ACTIVE )); then
        desired='beam'
    else
        desired='default'
    fi

    [[ $_zle_cursor_state == "$desired" ]] && return
    _zle_cursor_state=$desired

    case $desired in
        beam)
        # DECSCUSR 6: steady beam cursor
        printf '\e[6 q'
        ;;
        default)
        # DECSCUSR 0: restore terminal-configured cursor
        printf '\e[0 q'
        ;;
    esac
}

_restore_zle_cursor() {
    printf '\e[0 q'
    _zle_cursor_state=''
}

add-zle-hook-widget line-pre-redraw _update_zle_cursor
add-zle-hook-widget line-finish _restore_zle_cursor


# ---------------------------------------------------------------------------
# Keybindings
# ---------------------------------------------------------------------------

# Shift+Arrow: select by character
bindkey -M emacs $'\e[1;2D' select-char-left
bindkey -M emacs $'\e[1;2C' select-char-right

# Option+Shift+Arrow: select by word
bindkey -M emacs $'\e[1;4D' select-word-left
bindkey -M emacs $'\e[1;4C' select-word-right

# Command+Shift+Arrow: select to line boundary
bindkey -M emacs $'\e[1;10D' select-to-beginning
bindkey -M emacs $'\e[1;10C' select-to-end

# Command+C
bindkey -M emacs $'\e[99~' copy-selection

# Command+X
bindkey -M emacs $'\e[100~' cut-selection

# Backspace
bindkey -M emacs '^?' selection-backspace

# Tab
bindkey '^I' _tab_or_complete
bindkey '^[[Z' _shift_tab_or_reverse_complete

# Delete / Fn+Backspace
bindkey -M emacs $'\e[3~' selection-delete

bindkey -M emacs $'\e[97~' move-to-buffer-beginning
bindkey -M emacs $'\e[98~' move-to-buffer-end

bindkey -M emacs $'\e[1;10A' select-to-buffer-beginning
bindkey -M emacs $'\e[1;10B' select-to-buffer-end

# Normal arrow keys, including application-cursor variants
bindkey -M emacs $'\e[D' selection-left
bindkey -M emacs $'\e[C' selection-right
bindkey -M emacs $'\eOD' selection-left
bindkey -M emacs $'\eOC' selection-right

# Completion and autosuggestion controls
#
# Tab: accept an inline suggestion or open completion
# Shift+Tab: move backward through completion candidates
# Esc: dismiss an inline suggestion or cancel menu selection
bindkey -M emacs '^I' _tab_or_complete
bindkey -M emacs '^[[Z' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M emacs '\e' autosuggest-clear
bindkey -M menuselect '\e' send-break
