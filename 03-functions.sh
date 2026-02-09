# -----------------------------------------------------------------------------
# NAVIGATION & DOCKER
# -----------------------------------------------------------------------------

# Quick docker compose project navigation and control
dcp() {
    if [ -z "$1" ]; then
        cd /opt/docker/compose && ls -d */
    else
        cd /opt/docker/compose/"$1" && docker compose up -d
    fi
}

# Quick project directory jumper
proj() {
    local dirs=(~/projects ~/code /opt/docker/compose)
    if [ -z "$1" ]; then
        echo "Available projects:"
        for dir in "${dirs[@]}"; do
            [ -d "$dir" ] && ls -d "$dir"/*/ 2>/dev/null
        done
    else
        for dir in "${dirs[@]}"; do
            if [ -d "$dir/$1" ]; then
                cd "$dir/$1"
                return 0
            fi
        done
        echo "Project '$1' not found"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# GIT HELPERS
# -----------------------------------------------------------------------------

# Git branch in prompt helper
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# -----------------------------------------------------------------------------
# CLIPBOARD HELPERS
# -----------------------------------------------------------------------------
unalias t c tc 2>/dev/null

_copy_to_clipboard() {
    local file=$1
    if command -v wl-copy >/dev/null; then
        for i in {1..2}; do
            if timeout 2s wl-copy < "$file" 2>/dev/null; then
                echo "Copied to clipboard (Wayland)"
                return 0
            fi
            sleep 0.2
        done
    elif command -v xclip >/dev/null; then
        xclip -selection clipboard < "$file"
        echo "Copied to clipboard (xclip)"
        return 0
    elif command -v xsel >/dev/null; then
        xsel --clipboard --input < "$file"
        echo "Copied to clipboard (xsel)"
        return 0
    fi
    echo "Clipboard copy failed (no supported tool found)"
    return 1
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
    echo "Saved to $file"
    return $status
}

# -----------------------------------------------------------------------------
# FILE UTILITIES
# -----------------------------------------------------------------------------

# Create directory and cd into it
mkcd() {
    mkdir -p -- "$1" && cd -P -- "$1" || return
    echo "Created and changed to directory: $(pwd)"
}

# Universal archive extractor
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/to/file>"
        return 1
    fi
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.tar.xz)    tar xvJf "$1"    ;;
            *.lzma)      unlzma "$1"      ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "Don't know how to extract '$1'" ; return 2 ;;
        esac
    else
        echo "'$1' is not a valid file."
        return 3
    fi
}

# Backup file with timestamp
bak() {
    if [ -z "$1" ]; then
        echo "Usage: bak <filename>"
        return 1
    fi
    local timestamp=$(date +%Y%m%d-%H%M%S)
    cp -aiv "$1" "${1%/}_${timestamp}.bak"
}

# Search for text in files recursively
findtext() {
    local term="$1"
    local pattern="${2:-*}"
    local dir="${3:-.}"
    if [ -z "$term" ]; then
        echo "Usage: findtext \"search_term\" [file_pattern] [directory]"
        return 1
    fi
    grep --color=always -rniI "$term" "$dir" --include="$pattern" | less -R
}

# -----------------------------------------------------------------------------
# PRINTING HELPERS
# -----------------------------------------------------------------------------

quickprint() {
    if [ $# -eq 0 ]; then
        echo "Usage: quickprint <file> [copies]"
        return 1
    fi
    local copies=${2:-1}
    lp -d DCP-L2550DW -n "$copies" "$1"
}

queueclear() {
    cancel -a DCP-L2550DW
    echo "Print queue cleared."
}

printtest() {
    lp -d DCP-L2550DW /usr/share/cups/data/testprint
}