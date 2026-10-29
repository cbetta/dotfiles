# dotfiles

Re-usable dotfiles managed using `rcm`.

## Installation

* First, install [Homebrew](https://brew.sh)
* Then, clone this repo to `~/.dotfiles` and run `~/.dotfiles/install.sh`

This installs everything in the `Brewfile` (CLI tools, iTerm2, VS Code, OrbStack, 1Password, SizeUp), oh-my-zsh with powerlevel10k and plugins, Node LTS via nvm, and the latest Python via pyenv, and links the dotfiles into `~` with `rcup`.

The first time iTerm2 opens, powerlevel10k runs its setup wizard.
