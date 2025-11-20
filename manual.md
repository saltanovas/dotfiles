## Permissions

1. Grant **accessibility permissions** for `Alacritty`, `Raycast`, `MonitorControl`:
    ```bash
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
    ```
2. Grant **full disk access** for `Alacritty` & `Raycast`:
    ```bash
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"
    ```
3. Grant **screen recording access** for `Zoom` & `Google Chrome`:
    ```bash
    open "x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture"
    ```

## Internet Account

Add my personal Google account:

```bash
open "x-apple.systempreferences:com.apple.Internet-Accounts-Settings.extension"
```

## Battery

1. `open "x-apple.systempreferences:com.apple.preference.battery"`
2. At the bottom click `Options` and enable `Slightly dim the display on battery`
3. `Battery Health` -> Enable `Optimize Battery Charging`

## Keyboard

It seems that keyboard brightness settings must now be adjusted manually:

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

## Raycast

Import Raycast settings:

1. Open Raycast
2. Run `Import Settings & Data`
3. Import `~/dotfiles/.config/raycast/config.rayconfig`

## Default web browser

Set **Default web browser** to `Google Chrome`:

```bash
open "x-apple.systempreferences:com.apple.Desktop-Settings.extension"
```

## Google Chrome

There are no fully automated ways besides [Enterprise Policy](https://support.google.com/chrome/a/answer/187202?hl=en),
which applies rarely. This was a security decision in 2014 by Chrome team, because malware that did that was
rampant: https://blog.chromium.org/2015/05/continuing-to-protect-chrome-users-from.html

1. Head to `chrome://extensions/`
2. Enable `Developer mode` in the top right corner
3. Click `Load unpacked` and select a preferred theme under `~/dotfiles/.config/chrome/themes`

## Spotify

1. Enable local files:
    1. Scroll to `Your Library`
    2. Enable `Show Local Files`
2. Change default audio quality:
    1. Scroll to `Audio Quality`
    2. Click `Streaming quality`
    3. Select `Very High` from the dropdown list

## Verify login items

Verify and adjust the applications and services configured to launch automatically at login:

```bash
open "x-apple.systempreferences:com.apple.LoginItems-Settings.extension"
```
