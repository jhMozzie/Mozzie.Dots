# ===============================================================
export PATH="$HOME/.cargo/bin:$PATH"
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
alias savedots="
  # 1. Limpieza preventiva en el backup
  rm -rf ~/Mozzie.Dots/nvim ~/Mozzie.Dots/zellij;
  
  # 2. Creación de directorios de destino
  mkdir -p ~/Mozzie.Dots/nvim ~/Mozzie.Dots/zellij;
  
  # 3. Copia de Neovim (Ruta: /Users/jhmozzie/.config/nvim)
  # Usamos /. para copiar el contenido y no crear una carpeta noda
  cp -R ~/.config/nvim/. ~/Mozzie.Dots/nvim/;
  
  # 4. Copia de Zellij (Ruta: ~/.config/zellij)
  cp -R ~/.config/zellij/. ~/Mozzie.Dots/zellij/;
  
  # 5. Copia de archivos base
  cp ~/.zshrc ~/Mozzie.Dots/.zshrc;
  cp ~/.config/starship.toml ~/Mozzie.Dots/starship.toml;
  
  # 6. Proceso de Git
  cd ~/Mozzie.Dots && \
  git add . && \
  git commit -m 'Update: Full backup of Nvim and Zellij configs' && \
  git push origin main
"

# ===============================================================
# FUNCTIONS
# ===============================================================
nvimconfig(){
  cd ~/.config/nvim || return
  nvim
}

savedots() {
    echo "Starting backup to Mozzie.Dots..."

    # 1. Limpieza preventiva
    rm -rf ~/Mozzie.Dots/nvim
    rm -rf ~/Mozzie.Dots/zellij

    # 2. Creación de directorios
    mkdir -p ~/Mozzie.Dots/nvim
    mkdir -p ~/Mozzie.Dots/zellij

    # 3. Copia de Neovim (Asegurando que no se traten como sub-repos)
    # Copiamos todo, pero luego borramos cualquier carpeta .git interna 
    # para que GitHub no bloquee la subida de la carpeta nvim.
    cp -R ~/.config/nvim/. ~/Mozzie.Dots/nvim/
    find ~/Mozzie.Dots/nvim -name ".git" -exec rm -rf {} + 2>/dev/null

    # 4. Copia de Zellij
    cp -R ~/.config/zellij/. ~/Mozzie.Dots/zellij/

    # 5. Copia de archivos base
    cp ~/.zshrc ~/Mozzie.Dots/.zshrc
    cp ~/.config/starship.toml ~/Mozzie.Dots/starship.toml

    # 6. Proceso de Git
    cd ~/Mozzie.Dots
    git add .
    git commit -m "Update: Full backup of Nvim and Zellij configs"
    git push origin main
    
    echo "Backup complete!"
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
