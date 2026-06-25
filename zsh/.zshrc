# ==============================================================================
# 1. HISTORY SETTINGS
# ==============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Share history across all open terminal tabs immediately
setopt SHARE_HISTORY
# Don't record duplicate commands consecutively
setopt HIST_IGNORE_DUPS
# Remove extra blanks from commands before saving
setopt HIST_REDUCE_BLANKS

# ==============================================================================
# 2. AUTO-COMPLETION SYSTEM
# ==============================================================================
autoload -Uz compinit && compinit

# Enable a visual menu when hitting Tab
zstyle ':completion:*' menu select
# Case-insensitive matching (type lowercase, it still matches uppercase files)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Colorize the completion menu using your terminal's colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ==============================================================================
# 3. INTERACTIVE FEATURES & QUALITY OF LIFE
# ==============================================================================
# Automatically 'cd' into a directory just by typing its name
setopt AUTO_CD

# Use human-readable modern keybindings (Home/End/Delete keys work properly)
bindkey -e
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# ==============================================================================
# 4. ALIASES (Your Terminal Shortcuts)
# ==============================================================================
# Colorize standard commands
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Navigating made lazy
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Shortcuts for safety and speed
alias ll="ls -lh"       # Detailed, human-readable list of all files
alias mkdir="mkdir -p"   # Create nested directories without complaining
alias zshconfig="nano ~/.zshrc"
alias reload="source ~/.zshrc"

# Core Zypper commands
alias zup="sudo zypper dup"                      # Upgrade the system (The rolling release way)
alias zin="sudo zypper in"                       # Install a package
alias zrm="sudo zypper rm"                       # Remove a package
alias zse="zypper se"                            # Search for a package
alias zinfo="zypper info"                        # View package details
alias zref="sudo zypper ref"                     # Refresh repositories

# Cleanup & Maintenance
alias zclean="sudo zypper clean -a"              # Clean all repository caches
alias zrmdeps="sudo zypper rm -u"                # Remove package and its unused dependencies
alias zlog="less /var/log/zypp/history"         # View zypper history log

# YaST (Yet another Setup Tool)
alias yast="sudo yast2"                          # Launch graphical YaST
alias yastt="sudo yast2 --text"                  # Launch ncurses (terminal) YaST

# Systemd / Services
alias sys="sudo systemctl"
alias jctl="journalctl -xe"

# Flatpak (Commonly used alongside Tumbleweed)
alias flin="flatpak install"
alias flun="flatpak uninstall"
alias flup="flatpak update"

# ==============================================================================
# 5. THE PROMPT (The look and feel)
# ==============================================================================
# A clean, modern two-line prompt: [Directory] on [Time]
# Top line: Green directory path, Dimmed timestamp
# Bottom line: A crisp arrow symbol (%# changes to # if you are root)
PROMPT='%F{green}%~%f %F{242}(%D{%H:%M:%S})%f
%F{cyan}➔%f '

# Starship
eval "$(starship init zsh)"
