# ===============================================================
# TERMINAL COLOR SUPPORT
# ===============================================================
export TERM=xterm-256color

# ===============================================================
# ZSH COMPLETION INIT — debe ser lo primero
# ===============================================================
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# ===============================================================
# SHELL ENHANCEMENTS
# ===============================================================
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Carapace — después de bashcompinit
source <(carapace _zsh)

# Zsh Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ===============================================================
# VERSION MANAGERS
# ===============================================================
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/jhmozzie/.bun/_bun" ] && source "/Users/jhmozzie/.bun/_bun"

source <(ng completion script)

# ===============================================================
# PERSONAL ALIASES
# ===============================================================
alias Angular="cd ~/Documents/Projects/Angular"
alias nvimfile="cd ~/.config/nvim"
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias code="/usr/local/bin/code"
alias surf="open -a 'Windsurf'"

# ===============================================================
# GITHUB CLI ALIASES
# ===============================================================
alias gh-p-new="gh repo create --private --source=. --remote=origin --push"
alias gh-new="gh repo create --public --source=. --remote=origin --push"
alias gh-web="gh repo view --web"

# ===============================================================
# DOTFILES BACKUP
# ===============================================================
alias savedots="cp ~/.zshrc ~/Mozzie.Dots/ && cp ~/.vimrc ~/Mozzie.Dots/ && cp ~/.config/starship.toml ~/Mozzie.Dots/ && cd ~/Mozzie.Dots && git add . && git commit -m 'Update dotfiles' && git push"

# ===============================================================
# FUNCTIONS
# ===============================================================
nvimconfig(){
  cd ~/.config/nvim || return
  nvim
}

# ===============================================================
# ZELLIJ
# ===============================================================
alias zj="zellij"
alias zja="zellij attach"
alias zjls="zellij list-sessions"
alias zellijconfig="nvim ~/.config/zellij/config.kdl"

if [ -z "$ZELLIJ" ]; then
  zellij
fi

# ===============================================================
# PROMPT — ÚLTIMA LÍNEA SIEMPRE
# ===============================================================
eval "$(starship init zsh)"
