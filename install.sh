#!/bin/zsh
set -e
cd "${0:A:h}"

# Homebrew dependencies
brew bundle --file=Brewfile

# iTerm2 shell integration
curl -fsSL https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# Dotfiles
RCRC=rcrc rcup -v

# macOS preferences, and Rectangle with the shortcuts I had in SizeUp
./macos.sh
./rectangle.sh

# Node (LTS) and Python (latest)
export NVM_DIR="$HOME/.nvm"
mkdir -p $NVM_DIR
set +e # nvm doesn't support set -e
source "$(brew --prefix nvm)/nvm.sh"
nvm install --lts && nvm alias default 'lts/*'
set -e
pyenv install --skip-existing 3
pyenv global "$(pyenv latest 3)"

echo "By hand: System Settings → Spotlight → Search Privacy… → add ~/.gradle, ~/.pyenv and ~/.nvm (see README)"
