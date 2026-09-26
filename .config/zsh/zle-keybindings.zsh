# ---------------------------------------------------------------------------
# Selection
# ---------------------------------------------------------------------------

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


# Command+Shift+Left: extend selection to the beginning of the line
_select_to_beginning() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle beginning-of-line
    REGION_ACTIVE=1
}
zle -N select-to-beginning _select_to_beginning


# Command+Shift+Right: extend selection to the end of the line
_select_to_end() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    zle end-of-line
    REGION_ACTIVE=1
}
zle -N select-to-end _select_to_end


# Command+Shift+Up: extend selection to the beginning of the multiline buffer
_select_to_buffer_beginning() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    CURSOR=0
    REGION_ACTIVE=1
}
zle -N select-to-buffer-beginning _select_to_buffer_beginning


# Command+Shift+Down: extend selection to the end of the multiline buffer
_select_to_buffer_end() {
    (( REGION_ACTIVE )) || MARK=$CURSOR
    CURSOR=${#BUFFER}
    REGION_ACTIVE=1
}
zle -N select-to-buffer-end _select_to_buffer_end


# ---------------------------------------------------------------------------
# Clipboard
# ---------------------------------------------------------------------------

# Command+C: copy the active selection to the macOS clipboard
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


# Command+X: cut the active selection to the macOS clipboard
_cut_selection() {
    (( REGION_ACTIVE )) || return

    zle kill-region
    printf '%s' "$CUTBUFFER" | pbcopy
    REGION_ACTIVE=0
}
zle -N cut-selection _cut_selection


# ---------------------------------------------------------------------------
# Movement
# ---------------------------------------------------------------------------

# Left: collapse the selection to its left edge or move one character left
_selection_left() {
    if (( REGION_ACTIVE )); then
        (( CURSOR = CURSOR < MARK ? CURSOR : MARK ))
        REGION_ACTIVE=0
    else
        zle backward-char
    fi
}
zle -N selection-left _selection_left


# Right: collapse the selection to its right edge or move one character right
_selection_right() {
    if (( REGION_ACTIVE )); then
        (( CURSOR = CURSOR > MARK ? CURSOR : MARK ))
        REGION_ACTIVE=0
    else
        zle forward-char
    fi
}
zle -N selection-right _selection_right


# Command+Up: move to the beginning of the multiline buffer
_move_to_buffer_beginning() {
    CURSOR=0
    REGION_ACTIVE=0
}
zle -N move-to-buffer-beginning _move_to_buffer_beginning


# Command+Down: move to the end of the multiline buffer
_move_to_buffer_end() {
    CURSOR=${#BUFFER}
    REGION_ACTIVE=0
}
zle -N move-to-buffer-end _move_to_buffer_end


# ---------------------------------------------------------------------------
# Deletion
# ---------------------------------------------------------------------------

# Backspace: delete the selection or the previous character
_selection_backspace() {
    if (( REGION_ACTIVE )); then
        zle kill-region
        REGION_ACTIVE=0
    else
        zle backward-delete-char
    fi
}
zle -N selection-backspace _selection_backspace


# Delete: delete the selection or the next character
_selection_delete() {
    if (( REGION_ACTIVE )); then
        zle kill-region
        REGION_ACTIVE=0
    else
        zle delete-char
    fi
}
zle -N selection-delete _selection_delete


# ---------------------------------------------------------------------------
# Cursor
# ---------------------------------------------------------------------------

# Selection: use a beam cursor while a selection is active
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
            # DECSCUSR 0: terminal-configured cursor
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

# Command+C: copy selection
bindkey -M emacs $'\e[99~' copy-selection

# Command+X: cut selection
bindkey -M emacs $'\e[100~' cut-selection

# Backspace: delete selection or previous character
bindkey -M emacs '^?' selection-backspace

# Delete: delete selection or next character
bindkey -M emacs $'\e[3~' selection-delete

# Left: collapse selection or move one character left
bindkey -M emacs $'\e[D' selection-left
bindkey -M emacs $'\eOD' selection-left

# Right: collapse selection or move one character right
bindkey -M emacs $'\e[C' selection-right
bindkey -M emacs $'\eOC' selection-right

# Shift+Left: select one character left
bindkey -M emacs $'\e[1;2D' select-char-left

# Shift+Right: select one character right
bindkey -M emacs $'\e[1;2C' select-char-right

# Option+Shift+Left: select one word left
bindkey -M emacs $'\e[1;4D' select-word-left

# Option+Shift+Right: select one word right
bindkey -M emacs $'\e[1;4C' select-word-right

# Command+Up: move to the beginning of the multiline buffer
bindkey -M emacs $'\e[97~' move-to-buffer-beginning

# Command+Down: move to the end of the multiline buffer
bindkey -M emacs $'\e[98~' move-to-buffer-end

# Command+Shift+Up: select to the beginning of the multiline buffer
bindkey -M emacs $'\e[1;10A' select-to-buffer-beginning

# Command+Shift+Down: select to the end of the multiline buffer
bindkey -M emacs $'\e[1;10B' select-to-buffer-end

# Command+Shift+Left: select to the beginning of the line
bindkey -M emacs $'\e[1;10D' select-to-beginning

# Command+Shift+Right: select to the end of the line
bindkey -M emacs $'\e[1;10C' select-to-end