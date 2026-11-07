# Installation

Installation is idempotent: rerunning is safe, existing files are handled, and backups are created when required.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/saltanovas/dotfiles/main/install.sh)"
```

Some settings are not fully scriptable and must be configured manually. See the [manual](MANUAL.md).

# A keyboard with a point of view

A shortcut should feel inevitable. Each modifier has a job; each letter gives a clue.

| Key           | Territory                                        |
| ------------- | ------------------------------------------------ |
| **Right ⌘**   | The Mac: apps, windows, clipboard, screenshots   |
| **Left ⌘**    | The app in front of me; **⌘Space** opens Raycast |
| **⌃ Control** | The terminal; **⌃Space** leads into tmux         |

App shortcuts follow intent: **Right ⌘A** for **AI**, **Right ⌘D** for **development**, **Right ⌘S** for **search** etc. A small vocabulary that leaves room to grow.

The terminal still feels like a text editor: **⇧←/→** selects characters, **⌥⇧←/→** selects words, and **⌘C / ⌘X** copies or cuts. [Alacritty](.config/alacritty/.alacritty.toml) and [Zsh](.config/zsh/zle-keybindings.zsh) keep those habits intact.

### Built around my hands

- **Caps Lock** also acts as Right ⌘. It felt awkward under my pinky at first, but habit caught up. It may eventually become my main leader and retire the physical Right Command key.

- Why no dedicated keyboard backlight keys? I [remapped](.config/osx/keymap/com.local.KeyRemapping.plist) the two keys I use least—Dictation and Do Not Disturb (**F5/F6**)—to bring them back.

- Conflicting macOS shortcuts are [disabled](.config/osx/keymap/hotkeys.sh), giving these bindings room to work.

# The daily cast

A few tools earn their place every day:

| Tool | What it does for me |
| --- | --- |
| **Raycast** | App launcher, window management, clipboard history, and snippets. One familiar place for the small things I do all day. |
| **Alacritty → tmux → Zsh** | Alacritty opens straight into tmux for sessions, windows, and panes, with Zsh as my shell. fzf-tab adds fuzzy completion, zsh-autosuggestions supplies inline suggestions, and custom bindings keep editing familiar. |
| **MonitorControl** | Brightness control for external displays. |
| **mise** | Development runtimes, configured per project. |
| **ripgrep, fd, bat, fzf & tv** | Faster, friendlier community-driven alternatives to the usual terminal tools. fzf and tv add interactive fuzzy finding for files, history, and more. |

### What I left behind

I tried **Hammerspoon**, **yabai**, and **skhd**. The possibilities were appealing, but the setup and upkeep were more than I needed for launching apps and moving windows. Raycast covers my everyday needs with less to maintain.

# Thanks

The projects below inspired and helped to shape my dotfiles setup:

- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [yannbertrand/macos-defaults](https://github.com/yannbertrand/macos-defaults)
- [victory-sokolov/dotfiles](https://github.com/victory-sokolov/dotfiles)
