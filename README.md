# dotfiles

Re-usable dotfiles managed using `rcm`.

## Installation

* First, install [Homebrew](https://brew.sh)
* Then, clone this repo to `~/.dotfiles` and run `~/.dotfiles/install.sh`

This installs everything in the `Brewfile` (CLI tools, Starship, zsh plugins, iTerm2, VS Code, Android Studio, OrbStack, 1Password, Rectangle, Tailscale), Node LTS via nvm, and the latest Python via pyenv, and links the dotfiles into `~` with `rcup`.

The Starship prompt uses Nerd Font icons, so set iTerm2's font to JetBrainsMono Nerd Font Mono (Settings → Profiles → Text).

`rectangle.sh` gives Rectangle the window shortcuts I used in SizeUp. Rectangle needs Accessibility access (System Settings → Privacy & Security → Accessibility) before they work.

Keep Spotlight out of the build and runtime caches, tens of thousands of files nobody searches: System Settings → Spotlight → Search Privacy… (at the bottom) → **+** → ⌘⇧G, then add `~/.gradle`, `~/.pyenv` and `~/.nvm`. macOS only allows this by hand, so `install.sh` ends with a reminder.

## Smaller Macs (optional)

On an older or smaller Mac, `./macos-lean.sh` turns off Siri and most window, Dock, Mission Control, Finder and Quick Look animations. It isn't part of `install.sh`. It also lists the settings macOS keeps out of a script's reach, which matter most: Reduce transparency (Accessibility → Display) and Reduce motion (Accessibility → Motion), which take out Liquid Glass's blur, and iTerm2's transparency and blur. On Razorback (8 GB M1, macOS 27) these took WindowServer from about 42% CPU to 4%.
