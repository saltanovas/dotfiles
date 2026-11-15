abort() { printf '\033[1;38;2;255;85;85m❌ ERROR\033[0;38;2;245;245;245m %s\033[0m\n' "$*" >&2 && exit }
ohai() { printf '\033[1;38;2;203;166;247m==>\033[0;38;2;245;245;245m %s\033[0m\n' "$*" }

mkcd() { mkdir -p "$1" && cd "$1"; }

rr() {
    case "${1:-}" in
        duti) duti "$XDG_CONFIG_HOME/duti/duti.conf" ;;
        mise) mise upgrade ;;
        tv)   tv update-channels ;;
        tmux) tmux source-file "$XDG_CONFIG_HOME/tmux/tmux.conf" ;;
        zsh)
            source "$XDG_CONFIG_HOME/zsh/.zshrc" &&
            source "$XDG_CONFIG_HOME/zsh/.zprofile" &&
            source "$XDG_CONFIG_HOME/zsh/.zshenv"
            ;;
        all) rr zsh && rr duti && rr tmux && rr tv && rr mise ;;
        *)
            printf 'Usage: rr {duti|mise|tv|tmux|zsh|all}\n' >&2
            return 2
            ;;
    esac
}
