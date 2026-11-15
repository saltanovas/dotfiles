# dotbot

> Bootstrap dotfiles from a configuration file.
> Create symlinks and directories, and run setup commands.
> More information: https://github.com/anishathalye/dotbot

- Apply a configuration from the current directory:

`dotbot --config-file {{install.conf.json}}`

- Preview changes without applying them:

`dotbot --dry-run --config-file {{install.conf.json}}`

- Use a specific dotfiles directory as the base for relative paths:

`dotbot --base-directory {{path/to/dotfiles}} --config-file {{path/to/install.conf.json}}`

- Run only the symlink tasks:

`dotbot --config-file {{install.conf.json}} --only link`

- Apply the configuration while skipping shell commands:

`dotbot --config-file {{install.conf.json}} --except shell`

- Show detailed output, including shell command output:

`dotbot -vv --config-file {{install.conf.json}}`

- Stop after the first failed directive:

`dotbot --exit-on-failure --config-file {{install.conf.json}}`
