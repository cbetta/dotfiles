# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/cbetta/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git node npm github zsh-syntax-highlighting zsh-autosuggestions git-open)
source $ZSH/oh-my-zsh.sh

setopt histignorespace

# Editor
export EDITOR='nvim'

# Allow ctrl-s in vim
alias vim="stty stop '' -ixoff ; nvim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# tabs
tabs -2

# aliases
alias up='ngrok http -hostname=c.betta.io -region=eu'
alias ups='ngrok tls -hostname c.betta.io -region=eu —crt /etc/letsencrypt/live/c.betta.io/cert.pem —key /etc/letsencrypt/live/c.betta.io/privkey.pem'

# .zshrc
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

iterm2_print_user_vars() {
  # extend this to add whatever
  # you want to have printed out in the status bar
  iterm2_set_user_var nodeVersion $(node -v)
  iterm2_set_user_var pwd $(pwd)
}

# colored cat command
alias cat='bat'
alias l='exa -la --git'

source "`brew --prefix`/etc/grc.bashrc"
alias colourify="$GRC -es --colour=auto"
alias diff='colourify diff'
alias make='colourify make'
alias ping='colourify ping'
alias traceroute='colourify /usr/sbin/traceroute'
alias head='colourify head'
alias tail='colourify tail'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# box autocomplete setup
BOX_AC_ZSH_SETUP_PATH=/Users/cbetta/Library/Caches/@box/cli/autocomplete/zsh_setup && test -f $BOX_AC_ZSH_SETUP_PATH && source $BOX_AC_ZSH_SETUP_PATH;
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
