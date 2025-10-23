# Mods

```javascript
MODS = {
    0=>"No modifier",
    131072=>"Shift",
    262144=>"Control",
    524288=>"Option",
    1048576=>"Command",
    393216=>"Shift + Control",
    655360=>"Shift + Option",
    1179648=>"Shift + Command",
    786432=>"Control + Option",
    1310720=>"Control + Command",
    1572864=>"Option + Command",
    917504=>"Shift + Control + Option",
    1441792=>"Shift + Control + Command",
    1703936=>"Shift + Option + Command",
    1835008=>"Control + Option + Command",
    1966080=>"Shift + Control + Option + Command",
}
```
# Shortcuts

## 1. Launchpad & Dock
#### 1.1. Turn Dock hiding on/off (⌥⌘D)
`52 = "{ enabled = 1; value = { parameters = ( 100, 2, 1572864 ); type = standard; }; };"`
#### 1.2. Show Launchpad
`160 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`

## 2. Display
#### 2.1. Decrease display brightness (F14)
`53 = "{ enabled = 1; value = { parameters = ( 65535, 107, 8388608 ); type = standard; }; };"`
#### 2.2. Increase display brightness (F15)
`54 = "{ enabled = 1; value = { parameters = ( 65535, 113, 8388608 ); type = standard; }; };"`

## 3. Mission Control
#### 3.1. Mission Control (⌃↑)
`32 = "{ enabled = 1; value = { parameters = ( 65535, 126, 8650752 ); type = standard; }; };"`
#### 3.2. Mission Control: Gets enabled, but never disabled
`34 = "{ enabled = 1; value = { parameters = ( 65535, 126, 8781824 ); type = standard; }; };"`
#### 3.3. Show Notification Center
`163 = "{ enabled= 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 3.4. Turn Do Not Disturb on/off
`175 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 3.5. Application windows(⌃↓)
`33 = "{ enabled = 1; value = { parameters = ( 65535, 125, 8650752 ); type = standard; }; };"`
#### 3.6. Application windows: Gets enabled, but never disabled
`35 = "{ enabled = 1; value = { parameters = ( 65535, 125, 8781824 ); type = standard; }; };"`
#### 3.7. Show Desktop (F11)
`36 = "{ enabled = 1; value = { parameters = ( 65535, 103, 8388608 ); type = standard; }; };"`
#### 3.8. Show Desktop: Gets enabled, but never disabled
`37 = "{ enabled = 1; value = { parameters = ( 65535, 103, 8519680 ); type = standard; }; };"`
#### 3.9. Turn Stage Manager on/off
`222 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 3.10. Quick Note (🌐Q)
`190 = "{ enabled = 1; value = { parameters = ( 113, 12, 8388608 ); type = standard; }; };"`
### Mission Control
#### 3.11. Move left a space (⌃←)
`79 = "{ enabled = 1; value = { parameters = ( 65535, 123, 8650752 ); type = standard; }; };"`
#### 3.12. Move left a space: Gets enabled, but never disabled
`80 = "{ enabled = 1; value = { parameters = ( 65535, 123, 8781824 ); type = standard; }; };"`
#### 3.13. Move right a space (⌃→)
`81 = "{ enabled = 1; value = { parameters = ( 65535, 124, 8650752 ); type = standard; }; };"`
#### 3.14. Move right a space: Gets enabled, but never disabled
`82 = "{ enabled = 1; value = { parameters = ( 65535, 124, 8781824 ); type = standard; }; };"`
#### 3.15. Switch to Desktop 1 (⌃1)
`118 = "{ enabled = 1; value = { parameters = ( 65535, 18, 262144 ); type = standard; }; };"`
#### 3.16. Switch to Desktop 2 (⌃2)
`119 = "{ enabled = 1; value = { parameters = ( 65535, 19, 262144 ); type = standard; }; };"`
#### 3.17. Switch to Desktop 3 (⌃3)
`120 = "{ enabled = 1; value = { parameters = ( 65535, 20, 262144 ); type = standard; }; };"`
#### 3.18. Switch to Desktop 4 (⌃4)
`121 = "{ enabled = 1; value = { parameters = ( 65535, 21, 262144 ); type = standard; }; };"`
#### 3.19. Switch to Desktop 5 (⌃5)
`122 = "{ enabled = 1; value = { parameters = ( 65535, 23, 262144 ); type = standard; }; };"`
#### 3.20. Switch to Desktop 6 (⌃6)
`123 = "{ enabled = 1; value = { parameters = ( 65535, 22, 262144 ); type = standard; }; };"`
#### 3.21. Switch to Desktop 7 (⌃7)
`124 = "{ enabled = 1; value = { parameters = ( 65535, 26, 262144 ); type = standard; }; };"`
#### 3.22. Switch to Desktop 8 (⌃8)
`125 = "{ enabled = 1; value = { parameters = ( 65535, 28, 262144 ); type = standard; }; };"`

## 4. Keyboard
#### 4.1. Change the way Tab moves focus (⌃F7)
`13 = "{ enabled = 1; value = { parameters = ( 65535, 98, 8650752 ); type = standard; }; };"`
#### 4.2. Turn keyboard access on or off (⌃F1)
`12 = "{ enabled = 1; value = { parameters = ( 65535, 122, 8650752 ); type = standard; }; };"`
#### 4.3. Move focus to the menu bar (⌃F2)
`7 = "{ enabled = 1; value = { parameters = ( 65535, 120, 8650752 ); type = standard; }; };"`
#### 4.4. Move focus to the Dock (⌃F3)
`8 = "{ enabled = 1; value = { parameters = ( 65535, 99, 8650752 ); type = standard; }; };"`
#### 4.5. Move focus to active or next window (⌃F4)
`9 = "{ enabled = 1; value = { parameters = ( 65535, 118, 8650752 ); type = standard; }; };"`
#### 4.6. Move focus to the window toolbar (⌃F5)
`10 = "{ enabled = 1; value = { parameters = ( 65535, 96, 8650752 ); type = standard; }; };"`
#### 4.7. Move focus to the floating window (⌃F6)
`11 = "{ enabled = 1; value = { parameters = ( 65535, 97, 8650752 ); type = standard; }; };"`
#### 4.8. Move focus to next window (⌘`)
`27 = "{ enabled = 1; value = { parameters = ( 96, 50, 1048576 ); type = standard; }; };"`
#### 4.9. Move focus to status menus (⌃F8)
`57 = "{ enabled = 1; value = { parameters = ( 65535, 100, 8650752 ); type = standard; }; };"`
#### 4.10. Show contextual menu (⌃⏎)
`159 = "{ enabled = 1; value = { parameters = ( 65535, 36, 262144 ); type = standard; }; };"`

## 5. Input Sources
#### 5.1. Select the previous input source (⌃Space)
`60 = "{ enabled = 1; value = { parameters = ( 32, 49, 262144 ); type = standard; }; };"`
#### 5.2. Select next source in Input menu (⌃⌥Space)
`61 = "{ enabled = 1; value = { parameters = ( 32, 49, 786432 ); type = standard; }; };"`

## 6. Screenshots
#### 6.1. Save picture of screen as a file (⇧⌘3)
`28 = "{ enabled = 1; value = { parameters = ( 51, 20, 1179648 ); type = standard; }; };"`
#### 6.2. Copy picture of screen to the clipboard (⌃⇧⌘3)
`29 = "{ enabled = 1; value = { parameters = ( 51, 20, 1441792 ); type = standard; }; };"`
#### 6.3. Save picture of selected area as a file (⇧⌘4)
`30 = "{ enabled = 1; value = { parameters = ( 54, 22, 1179648 ); type = standard; }; };"`
#### 6.4. Copy picture of selected area to the clipboard (⌃⇧⌘4)
`31 = "{ enabled = 1; value = { parameters = ( 52, 21, 1179648 ); type = standard; }; };"`
#### 6.5. Screenshot and recording options (⇧⌘5)
`184 = "{ enabled = 1; value = { parameters = ( 53, 23, 1179648 ); type = standard; }; };"`
#### 6.6. Save picture of the Touch Bar as a file (⇧⌘6)
`181 = "{ enabled = 1; value = { parameters = ( 54, 22, 1179648 ); type = standard; }; };"`
#### 6.7. Copy picture of the Touch Bar to the clipboard (⌃⇧⌘6)
`182 = "{ enabled = 1; value = { parameters = ( 54, 22, 1441792 ); type = standard; }; };"`

## 7. Presenter Overlay
#### 7.1. Turn Presenter Overlay (small) on or off
`224 = "{ enabled = 0; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 7.2. Turn Presenter Overlay (large) on or off
`223 = "{ enabled = 0; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`

## 8. Services
`defaults read pbs NSServicesStatus`
#### Development
#### Files and Folders
#### General
#### Internet
#### Messaging
#### Pictures
#### Searching
#### Text

## 9. Spotlight
#### 9.1. Show Spotlight search (⌘Space)
`64 = "{ enabled = 1; value = { parameters = ( 32, 49, 1048576 ); type = 'standard'; }; };"`
#### 9.2. Show Finder search window (⌥⌘Space)
`65 = "{ enabled = 1; value = { parameters = ( 32, 49, 1572864 ); type = 'standard'; }; };"`

## 10. Accessibility
#### 10.1. Increase contrast (⌃⌥⌘.)
`25 = "{ enabled = 1; value = { parameters = ( 46, 47, 1835008 ); type = 'standard'; }; };"`
#### 10.2. Decrease contrast (⌃⌥⌘,)
`26 = "{ enabled = 1; value = { parameters = ( 44, 43, 1835008 ); type = 'standard'; }; };"`
#### 10.3. Invert colours (⌃⌥⌘8)
`21 = "{ enabled = 1; value = { parameters = ( 56, 28, 1835008 ); type = 'standard'; }; };"`
#### 10.4. Show Accessibility controls (⌥⌘F5)
`162 = "{ enabled = 0; value = { parameters = ( 65535, 96, 9961472 ); type = 'standard'; }; };"`
#### 10.5. Turn speak item under the pointer on or off
`231 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = 'standard'; }; };"`
#### 10.6. Turn speak selection on or off
`230 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = 'standard'; }; };"`
#### 10.7. Turn typing feedback on or off
`232 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = 'standard'; }; };"`
#### 10.8. Turn VoiceOver on or off (⌘F5)
`59 = "{ enabled = 0; value = { parameters = ( 65535, 96, 9437184 ); type = 'standard'; }; };"`
### Live Speech
#### 10.9. Turn Live Speech on or off
`225 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 10.10. Toggle visibility
`226 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 10.11. Pause or resume speech
`227 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 10.12. Cancel speech
`228 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
#### 10.13. Hide or show phrases
`229 = "{ enabled = 1; value = { parameters = ( 65535, 65535, 0 ); type = standard; }; };"`
### Zoom
#### 10.14. Turn zoom on or off (⌥⌘8)
`15 = "{ enabled = 0; value = { parameters = ( 56, 28, 1572864 ); type = standard; }; };"`
#### 10.15. Turn image smoothing on or off (⌥⌘\\)
`23 = "{ enabled = 0; value = { parameters = ( 92, 65535, 1572864 ); type = standard; }; };"`
#### 10.16. Zoom out (⌥⌘-)
`19 = "{ enabled = 0; value = { parameters = ( 45, 27, 1572864 ); type = standard; }; };"`
#### 10.17. Zoom in (⌥⌘=)
`17 = "{ enabled = 0; value = { parameters = ( 61, 24, 1572864 ); type = standard; }; };"`
#### 10.18. Turn focus following on or off
`179 = "{ enabled = 0; value = { parameters = ( 65535, 65535, 0 ) ; type = standard; }; };"`

## 11. App Shortcuts
#### 11.1. Show Help menu (⇧⌘/)
`98 = "{ enabled = 1; value = { parameters = ( 47, 44, 1179648 ); type = standard; }; };"`

All macOS built-in command **overrides** are placed under `App Shortcuts`, but stored globally under `NSUserKeyEquivalents` and matched by the exact name:
- **Emoji & Symbols** (`⌘⌃Space`)
- **New Window** (`⌘N`)
- **Minimize** (`⌘M`)
- etc.

If the entry does not exist, default shortcut is applied.

## 12. Function Keys

## 13. Modifier Keys

## 14. Dictation
#### 14.1. Enable dictation (Press 🌐 Twice)
`164 = "{ enabled = 1; value = { parameters = ( 8388608, 4286578687 ); type = modifier; }; };"`
