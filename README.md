# dotfiles

Re-usable dotfiles managed using `rcm`.

## Installation

* First, install [Homebrew](https://brew.sh)
* Then, clone this repo to `~/.dotfiles` and run `~/.dotfiles/install.sh`

This installs everything in the `Brewfile` (CLI tools, Starship, zsh plugins, iTerm2, VS Code, Android Studio, OrbStack, 1Password, Rectangle, Tailscale), Node LTS via nvm, and the latest Python via pyenv, and links the dotfiles into `~` with `rcup`.

The Starship prompt uses Nerd Font icons, so set iTerm2's font to JetBrainsMono Nerd Font Mono (Settings → Profiles → Text).

`rectangle.sh` gives Rectangle the window shortcuts I used in SizeUp. Rectangle needs Accessibility access (System Settings → Privacy & Security → Accessibility) before they work.
