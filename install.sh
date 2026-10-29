#!/bin/zsh
set -e
cd "${0:A:h}"

# Homebrew dependencies
brew bundle --file=Brewfile

# oh-my-zsh, powerlevel10k and plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
[[ -d ~/.oh-my-zsh ]] || git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
[[ -d $ZSH_CUSTOM/themes/powerlevel10k ]] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
for repo in zsh-users/zsh-syntax-highlighting zsh-users/zsh-autosuggestions paulirish/git-open; do
  [[ -d $ZSH_CUSTOM/plugins/${repo:t} ]] || git clone --depth=1 https://github.com/$repo.git $ZSH_CUSTOM/plugins/${repo:t}
done

# iTerm2 shell integration
curl -fsSL https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# Dotfiles
RCRC=rcrc rcup -v

# Node (LTS) and Python (latest)
export NVM_DIR="$HOME/.nvm"
mkdir -p $NVM_DIR
set +e # nvm doesn't support set -e
source "$(brew --prefix nvm)/nvm.sh"
nvm install --lts && nvm alias default 'lts/*'
set -e
pyenv install --skip-existing 3
pyenv global "$(pyenv latest 3)"
