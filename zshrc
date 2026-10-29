# tabs (prints to the terminal, so must run before the instant prompt)
[[ -t 1 ]] && tabs -2

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Only run the p10k setup wizard in iTerm2, not in other terminals
[[ $TERM_PROGRAM != iTerm.app ]] && POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
plugins=(git node npm gh zsh-syntax-highlighting zsh-autosuggestions git-open)
source $ZSH/oh-my-zsh.sh

setopt histignorespace

# Editor
export EDITOR='nvim'

# Allow ctrl-s in vim
alias vim="stty stop '' -ixoff ; nvim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# iTerm2 shell integration
[[ $TERM_PROGRAM == iTerm.app ]] && test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

iterm2_print_user_vars() {
  # extend this to add whatever
  # you want to have printed out in the status bar
  iterm2_set_user_var nodeVersion $(node -v)
  iterm2_set_user_var pwd $(pwd)
}

# colored cat command
alias cat='bat'
alias l='eza -la --git'

# colourise common commands (diff, make, ping, traceroute, ...)
[[ -s "$HOMEBREW_PREFIX/etc/grc.zsh" ]] && source "$HOMEBREW_PREFIX/etc/grc.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
