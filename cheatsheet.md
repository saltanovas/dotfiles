Readings:
- https://github.com/rootsongjc/cheatsheets/blob/644ad82e534c0d1de4bbc3f78e104ad91871b8c3/bash.md?plain=1#L93





1. `$@` all arguments passed to the **function** or **script**
    - `$@` = "file not found try again" (word-split mess if unquoted)
    - `"$@"` = ["file not found", "try again"] (two separate arguments preserved)


### File Descriptors

#### Numbers
- `0` → stdin
- `1` → stdout
- `2` → stderr

`&` means “treat the target as a file descriptor, not a filename



`&>` is the same as `2>&1` in bash, but it's not the same in other shells, like dash! 

### Redirects

Redirection is essentially syntactic sugar for `open()` + `dup2()` system calls that the shell makes

#### Output
- `>`: Redirects stdout to the file, **rewrites**
- `>>`: Redirects stdout to the file, **appends**

#### Input
- `<`: Pulls-in stdin from the file, **rewrites**
- `>>`: Redirects stdout to the file, **appends**

```bash
$ sort < mylist.txt > alphabetical-file.txt
$ cat alphabetical-file.txt 
cat
cow
dog
horse
```



`/dev/null`, or the bit bucket, is used as a garbage can for the command line


strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/

`which` is not POSIX. If you want to be on the safe side, don’t rely on `which` to find the location of an executable. https://www.reddit.com/r/commandline/comments/qki77x/which_is_not_posix/


should I write posix compliant scripts?

the single `.` is shorthand for `source` in POSIX shells (bash, zsh, etc.).















### The order of redirections matters in Bash.

`/usr/libexec/java_home -V 2>&1 1>/dev/null`
This means:

- `2>&1` — redirect stderr (2) to where stdout (1) is currently pointing (the terminal).
- `1>/dev/null` — redirect stdout (1) to `null`.

Result: 
- Stdout goes to `null`.
- Stderr goes to the terminal (because at the moment of `2>&1`, stdout was still the terminal).
---

`/usr/libexec/java_home -V 1>/dev/null 2>&1`
This means:

- `1>/dev/null` — redirect stdout (1) to null.
- `2>&1` — redirect stderr (2) to where stdout (1) is now pointing (`null`).
Result:

- Both stdout and stderr go to `null`.

https://stackoverflow.com/questions/2342826/how-can-i-pipe-stderr-and-not-stdout/2342841#2342841





---------------------------------


# Dotfiles management strategy:

1. bare-repo strategy:
    - zero extra tools
    - everything lives exactly where it should
    - HOWEVER, no repo organization freedom; the repo must mirror your $HOME layout exactly. If a program expects `~/.zshrc`, then in the repo it’s tracked as `.zshrc` (at root).
    - https://www.reddit.com/r/commandline/comments/kf8u8f/switching_dotfiles_from_symlinks_to_a_bare_git/
2. symlink strategy:
    - more freedom in repo organization
    - BUT, requires extra tools (like `stow` or `chezmoi`)
    - AND, files live in two places: the repo and the actual location (e.g. `~/.zshrc`), which can be confusing


-----------------------------------

defaults write in a setup script
VS
importing/exporting plists



-----------------------------------

File	        Purpose	                Good for	                                Bad for
~/.zprofile	    Session bootstrap	    Environment variables, PATH, SDKs	        Aliases, prompt themes, interactive-only code
~/.zshrc	    Shell customization	    Aliases, functions, completions, prompts	Expensive one-time setup that never changes







----


List All Global Python Packages: `python -m pip list`
List packages in venv: `source .venv/bin/activate && pip list`

`source .venv/bin/activate` or `. .venv/bin/activate`


Before Python 3.3:
1. `pip install virtualenv` globally first,
2. then `virtualenv .venv` in the project directory
# https://virtualenv.pypa.io/en/latest/

After Python 3.3:
1. `python3 -m venv .venv` in the project directory
# https://docs.python.org/3/library/venv.html

Installing from requirements.txt:
`pip install -r requirements.txt`
# https://packaging.python.org/en/latest/tutorials/installing-packages/#installing-packages





# Load Order    Interactive  Interactive  Script
# Startup       Only login   Always
# ------------- -----------  -----------  ------
#  /etc/zshenv       1            1         1
#    ~/.zshenv       2            2         2
# /etc/zprofile      3
#   ~/.zprofile      4
# /etc/zshrc         5            3
#   ~/.zshrc         6            4
# /etc/zlogin        7
#   ~/.zlogin        8
#
# Shutdown
# ------------- -----------  -----------  ------
#   ~/.zlogout       9
# /etc/zlogout      10
#
# Note: ZSH seems to read ~/.profile as well, if ~/.zshrc is not present.




-----------------

🔑 Key Difference
Path	Purpose
/opt/homebrew/Cellar	Real files (per formula, versioned). Multiple versions can exist here.
/opt/homebrew/bin	Symlinks to the currently active version of each formula. This is what actually gets run when you type git.


✅ TL;DR

Cellar = where Homebrew stores actual package contents (with versions).

bin = symlinks to the active version’s executables, so your PATH stays simple.

This design is what lets you do things like:

brew switch git 2.45.0

…without touching your PATH — Homebrew just updates the symlink in /opt/homebrew/bin/git to point to a different version in Cellar.

--------------------------------


# export HOMEBREW_PREFIX="$(brew --prefix)"
# export HOMEBREW_CELLAR="$(brew --cellar)"
# export HOMEBREW_REPOSITORY="$(brew --repository)"



--------------------------------------

| Syntax                    | POSIX-compatible | Common? | Notes                                                                         |
| ------------------------- | ---------------- | ------- | ----------------------------------------------------------------------------- |
| `mkcd() { ... }`          | ✅ Yes            | ⭐⭐⭐⭐    | **Recommended** – works in almost every shell (`bash`, `zsh`, `dash`, `ksh`). |
| `function mkcd() { ... }` | ❌ No             | ⭐⭐⭐     | Bash/Zsh extension – redundant to use `function` *and* `()`.                  |
| `function mkcd { ... }`   | ❌ No             | ⭐⭐      | Bash/Zsh extension – shortest, but least common, may confuse readers.         |


----

encode VS encrypt VS hash

---

``ln -n`` behaves differently on linux and macOS, because Linux uses GNU coreutils, while macOS BSD utilities:

- On macOS, `ln -n` prevents overwriting an existing file or symlink at the destination.
- 
