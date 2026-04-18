## Grant permissions

1. Grant **accessibility permissions** for `Alacritty`, `Raycast`, `MonitorControl`:
    ```bash
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
    ```
2. Grant **full disk access** for `Alacritty`, `Terminal` & `Raycast`:
    ```bash
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"
    ```
3. Grant **screen recording access** for `Zoom` & `Google Chrome`:
    ```bash
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture"
    ```

## Add personal internet account

```bash
open "x-apple.systempreferences:com.apple.Internet-Accounts-Settings.extension"
```

## Set default web browser

```bash
open "x-apple.systempreferences:com.apple.Desktop-Settings.extension"
```

## Install PWAs

In work environments some apps are blocked, but PWAs are allowed. 
Use Safari PWAs, since I find them more resource efficient.

1. [Spotify](https://open.spotify.com/)
2. [M365 Copilot](https://m365.cloud.microsoft/chat/)

## Set keyboard brightness

1. `open "x-apple.systempreferences:com.apple.preference.keyboard"`
2. Enable `Adjust keyboard brightness in low light`
3. Set `Turn keyboard backlight off after` to 5 minutes

Previously, it was possible with:

```bash
# Adjust keyboard brightness in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard backlight off after 5 minutes of inactivity
defaults write com.apple.BezelServices kDimTime -int 300
```

## Review login items

Verify and adjust the applications and services configured to launch automatically at login:

```bash
open "x-apple.systempreferences:com.apple.LoginItems-Settings.extension"
```

## Review menu bar items

```bash
open "x-apple.systempreferences:com.apple.ControlCenter-Settings.extension"
```

## Configure Notification Center widgets

<img width="205" height="296" alt="test" src="https://github.com/user-attachments/assets/c25de636-ab93-4cd6-a280-4c46ac690025" />

## Configure Finder sidebar

<img width="151" height="299" alt="Screenshot 2026-04-12 at 22 31 36" src="https://github.com/user-attachments/assets/8f0b3df9-ef3f-4244-b913-cc61456ed523" />

## Import Raycast settings

1. Open Raycast
2. Run `Import Settings & Data`
3. Import `~/dotfiles/.config/raycast/config.rayconfig`

## Enforce default input device

This helps preserve battery life of Bluetooth headphones, since using them as a microphone drains it much faster.

1. Open Raycast
2. Search for `Set Input Device`
3. Choose built-in microphone and press `⇧⌘D`
4. Search for `Enforce Input Device` and press Enter to enable it

## Set custom Google Chrome theme

There are no fully automated ways besides [Enterprise Policy](https://support.google.com/chrome/a/answer/187202?hl=en),
which applies rarely. This was a security decision in 2014 by Chrome team, because malware that did that was
rampant: https://blog.chromium.org/2015/05/continuing-to-protect-chrome-users-from.html

1. Head to `chrome://extensions/`
2. Enable `Developer mode` in the top right corner
3. Click `Load unpacked` and select a preferred theme under `~/dotfiles/.config/chrome/themes`

## Configure Spotify

1. Enable local files:
    1. Scroll to `Your Library`
    2. Enable `Show Local Files`
2. Change default audio quality:
    1. Scroll to `Audio Quality`
    2. Click `Streaming quality`
    3. Select `Very High` from the dropdown list

## Customize VSCode layout

Layout is not configurable via settings, so must be configured manually:

`⌘⇧P -> Customize Layout -> Quick Input Position -> Center`
