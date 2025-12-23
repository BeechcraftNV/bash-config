# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Modern CLI tools (since you mentioned Rust alternatives)
alias ls='eza --group-directories-first'
alias ll='eza -la --group-directories-first'
alias lt='eza --tree --level=2'
alias ccat='batcat --paging=never'  # colored cat using bat

# Docker shortcuts
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'

# Homelab specific
alias lmde='ssh steve@192.168.29.43'
alias pool='cd /mnt/pool'
alias compose='cd /opt/docker/compose'

# Capture comman output
alias t='tee /tmp/out.txt'
alias tc='tee /tmp/claude_$(date +%s).txt'

alias c='tee /tmp/out.txt | wl-copy && echo "📋 Copied to clipboard + saved to /tmp/out.txt"'

