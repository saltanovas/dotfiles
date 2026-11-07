# Text replacer

Date: 2026-03-28

### Built-in macOS text replacement

Works in Apple apps only, so not really usable.

### Espanso

Clearly powerful:

- Supports [scripting](https://espanso.org/docs/matches/extensions/#script-extension)
- Have [forms](https://espanso.org/docs/matches/forms/)
- Many variable options
- Better fit for dotfiles/config-driven setup

However:

- Requires installing an extra tool, compared to Raycast
- Overkill: neither scripting, nor forms are needed

### Raycast

- Already installed
- Covers the core use case without extra setup

---

## Decision

Go with Raycast snippets for now.

- I don't need any advanced features.
- Avoids installing extra tooling.
- If I ever hit limitations (e.g. need scripting, forms), I can reconsider Espanso later.
