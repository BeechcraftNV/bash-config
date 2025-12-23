# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Modern CLI tools (since you mentioned Rust alternatives)
alias ls='eza --group-directories-first'
alias ll='eza -la --group-directories-first'
alias lt='eza --tree --level=2'
alias fd='fdfind'
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

# Capture command output
# Usage: <command> | tc  OR  tc <command>

# Remove existing aliases to prevent syntax errors when defining functions
unalias t c tc 2>/dev/null

_copy_to_clipboard() {
    local file=$1
    if command -v wl-copy >/dev/null; then
        # Retry mechanism: 2 attempts with a 2s timeout each
        for i in {1..2}; do
            if timeout 2s wl-copy < "$file" 2>/dev/null; then
                echo "📋 Copied to clipboard"
                return 0
            fi
            sleep 0.2
        done
        echo "⚠️  Clipboard copy timed out"
    fi
}

t() {
    local file="/tmp/out.txt"
    if [ $# -gt 0 ]; then
        eval "$@" 2>&1 | tee "$file"
        return ${PIPESTATUS[0]}
    else
        cat | tee "$file"
    fi
}

c() {
    local file="/tmp/out.txt"
    local status=0
    if [ $# -gt 0 ]; then
        eval "$@" 2>&1 | tee "$file"
        status=${PIPESTATUS[0]}
    else
        cat | tee "$file"
    fi
    _copy_to_clipboard "$file"
    return $status
}

tc() {
    local file="/tmp/claude_$(date +%Y%m%d_%H%M%S).txt"
    local status=0
    if [ $# -gt 0 ]; then
        eval "$@" 2>&1 | tee "$file"
        status=${PIPESTATUS[0]}
    else
        cat | tee "$file"
    fi
    _copy_to_clipboard "$file"
    echo "💾 Saved to $file"
    return $status
}

alias gem='npx @google/gemini-cli@latest'