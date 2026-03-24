# Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/saltanovas/dotfiles/main/install.sh)"
```

# Thanks

The projects below inspired and helped to shape my dotfiles setup:

- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [yannbertrand/macos-defaults](https://github.com/yannbertrand/macos-defaults)



All installation scripts are safe to run and are idempotent, creates backup files if necessary etc.
Holman’s dotfiles (very popular) treat bootstrap scripts as:
Idempotent scripts you can run many times without breaking anything.
So instead of doing “destructive checks,” everything behaves like:
“If not installed → install”
“If exists → update”
“If conflict → ask”
This philosophy works best for your case.
