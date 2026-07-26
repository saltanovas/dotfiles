#!/bin/bash

app="$HOME/Applications/mpv.app"
bundleid="io.mpv"
icon="$DOTFILES_ROOT/icns/mpv.png"
plist="$app/Contents/Info.plist"
pb="/usr/libexec/PlistBuddy"

extensions=(
    avi
    flac
    m4a
    m4v
    mkv
    mov
    mp3
    mp4
    mpeg
    mpg
    ogg
    opus
    wav
    webm
)

checkdeps() {
    for cmd in osacompile codesign duti mpv; do
        command -v "$cmd" >/dev/null 2>&1 || {
            printf 'Required command not found: %s\n' "$cmd" >&2
            return 1
        }
    done
}

compile() {
    rm -rf "$app"
    mkdir -p "$(dirname "$app")"

    osacompile -o "$app" <<'APPLESCRIPT'
        on run
            launchMPV("--idle=yes --force-window=yes")
        end run

        on open mediaFiles
            set mpvArguments to ""

            repeat with mediaFile in mediaFiles
                set mpvArguments to mpvArguments & " " & quoted form of POSIX path of mediaFile
            end repeat

            launchMPV(mpvArguments)
        end open

        on launchMPV(mpvArguments)
            set shellCommand to ¬
                "/usr/bin/env PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin " & ¬
                "mpv --terminal=no " & mpvArguments & ¬
                " </dev/null >/dev/null 2>>/tmp/mpv-app-errors.log &"

            do shell script shellCommand
        end launchMPV
APPLESCRIPT
}

configure() {
    local entries=(
        "CFBundleIdentifier:$bundleid"
        "CFBundleName:mpv"
        "CFBundleDisplayName:mpv"
        "CFBundleIconFile:mpv.icns"
    )
    local entry key value index

    cp "$icon" "$app/Contents/Resources/mpv.icns"

    for entry in "${entries[@]}"; do
        key="${entry%%:*}"
        value="${entry#*:}"

        "$pb" -c "Set :$key $value" "$plist" 2>/dev/null ||
            "$pb" -c "Add :$key string $value" "$plist"
    done

    "$pb" -c "Delete :CFBundleDocumentTypes" "$plist" 2>/dev/null || true
    "$pb" -c "Add :CFBundleDocumentTypes array" "$plist"
    "$pb" -c "Add :CFBundleDocumentTypes:0 dict" "$plist"
    "$pb" -c "Add :CFBundleDocumentTypes:0:CFBundleTypeName string Media" "$plist"
    "$pb" -c "Add :CFBundleDocumentTypes:0:CFBundleTypeRole string Viewer" "$plist"
    "$pb" -c "Add :CFBundleDocumentTypes:0:LSHandlerRank string Alternate" "$plist"
    "$pb" -c "Add :CFBundleDocumentTypes:0:CFBundleTypeExtensions array" "$plist"

    for index in "${!extensions[@]}"; do
        "$pb" -c "Add :CFBundleDocumentTypes:0:CFBundleTypeExtensions:$index string ${extensions[$index]}" "$plist"
    done

    codesign --force --deep --sign - "$app"
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f "$app"
}

associate() {
    for extension in "${extensions[@]}"; do
        duti -s "$bundleid" ".$extension" all
    done
}

checkdeps
compile
configure
associate
