# ===============================================================
# VERSION MANAGER CONFIGURATIONS
# ===============================================================

# SDKMAN: Required for managing Java versions (v17, v21, etc.)
# This must remain at the end of the script to initialize correctly.
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# NVM: Node Version Manager
# Essential for switching between Node/Angular versions (v18, v20, etc.)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Loads nvm bash_completion

# BUN: Fast JavaScript all-in-one toolkit
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/jhmozzie/.bun/_bun" ] && source "/Users/jhmozzie/.bun/_bun" # Bun completions

# ===============================================================
# PERSONAL ALIASES
# ===============================================================

# Navigation
alias projects="cd ~/Documents/Projects"

# Productivity & Config Management
alias zshconfig="vim ~/.zshrc"    # Quick edit zsh config
alias zshsource="source ~/.zshrc" # Apply changes immediately

# ===============================================================
# GITHUB CLI (GH) ALIASES
# ===============================================================

# Create a PRIVATE repo based on current folder name and push
alias gh-p-new="gh repo create --private --source=. --remote=origin --push"

# Create a PUBLIC repo based on current folder name and push
alias gh-new="gh repo create --public --source=. --remote=origin --push"

# Open the current repository in the web browser
alias gh-web="gh repo view --web"

# ===============================================================
# DOTFILES BACKUP SYSTEM (Mozzie.Dots)
# ===============================================================

# Sync all important configs to backup folder and push to GitHub
alias savedots="cp ~/.zshrc ~/Mozzie.Dots/ && cp ~/.vimrc ~/Mozzie.Dots/ && cp ~/.config/starship.toml ~/Mozzie.Dots/ && cd ~/Mozzie.Dots && git add . && git commit -m 'Update dotfiles' && git push"

# ===============================================================
# SHELL ENHANCEMENTS
# ===============================================================

# Carapace: Multi-shell command argument completer
source <(carapace _zsh)

# Zsh Autosuggestions: Fish-like fast forward suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship Prompt: The cross-shell customizable prompt
# THIS MUST BE THE LAST LINE OF THE FILE
eval "$(starship init zsh)"
