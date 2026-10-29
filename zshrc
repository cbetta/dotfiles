# tabs (prints to the terminal, so run it before anything else)
[[ -t 1 ]] && tabs -2

# Completion
autoload -Uz compinit && compinit

# Plugins
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # must be last

# Prompt (config in ~/.config/starship.toml)
eval "$(starship init zsh)"

# Key bindings
bindkey '^E' autosuggest-accept
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

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

# ls
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# git
alias gco="git checkout"
alias gcoi="git checkout --ignore-other-worktrees"
alias gst="git status"
alias gb="gh browse"

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

export PATH="$HOME/.local/bin:$PATH"

# Claude Code against a local model in LM Studio
export LOCAL_MODEL="qwen/qwen3.6-35b-a3b"
claude-local() {
  ANTHROPIC_BASE_URL=http://localhost:1234 \
  ANTHROPIC_AUTH_TOKEN=lmstudio \
  ANTHROPIC_DEFAULT_OPUS_MODEL="$LOCAL_MODEL" \
  ANTHROPIC_DEFAULT_SONNET_MODEL="$LOCAL_MODEL" \
  ANTHROPIC_DEFAULT_HAIKU_MODEL="$LOCAL_MODEL" \
  CLAUDE_CODE_MAX_CONTEXT_TOKENS=131072 \
  CLAUDE_CODE_MAX_OUTPUT_TOKENS=16384 \
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
  claude --model "$LOCAL_MODEL" --strict-mcp-config --mcp-config '{"mcpServers":{}}' "$@"
}
