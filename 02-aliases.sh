# -----------------------------------------------------------------------------
# COLOR ALIASES
# -----------------------------------------------------------------------------
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alert for long running commands: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# -----------------------------------------------------------------------------
# NAVIGATION
# -----------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias home='cd ~'

# Homelab specific
alias lmde='ssh steve@192.168.29.43'
alias pool='cd /mnt/pool'
alias compose='cd /opt/docker/compose'

# -----------------------------------------------------------------------------
# FILE LISTING (eza)
# -----------------------------------------------------------------------------
alias ls='eza --group-directories-first'
alias ll='eza -la --group-directories-first'
alias la='eza -la --group-directories-first'
alias lt='eza --tree --level=2'
alias l.='eza -d .*'

# -----------------------------------------------------------------------------
# FILE OPERATIONS (safer defaults)
# -----------------------------------------------------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I --preserve-root'
alias mkdir='mkdir -pv'
alias fd='fdfind'
alias ccat='batcat --paging=never'
alias ffind='find . -iname'

# -----------------------------------------------------------------------------
# DISK & SYSTEM INFO
# -----------------------------------------------------------------------------
alias duf='du -sh * | sort -rh'
alias dfh='df -hT'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'
alias myip='curl -s ifconfig.me || curl -s ipinfo.io/ip || wget -qO- icanhazip.com'
alias ports='sudo netstat -tulpn'
alias path='echo -e ${PATH//:/\\n}'

# -----------------------------------------------------------------------------
# APT PACKAGE MANAGEMENT
# -----------------------------------------------------------------------------
alias aptup='sudo apt update'
alias aptupg='sudo apt update && sudo apt upgrade -y'
alias aptin='sudo apt install'
alias aptrm='sudo apt remove'
alias aptsearch='apt search'
alias aptclean='sudo apt autoremove && sudo apt autoclean'

# -----------------------------------------------------------------------------
# DOCKER
# -----------------------------------------------------------------------------
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dpsinfo='docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'

# -----------------------------------------------------------------------------
# GIT
# -----------------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gap='git add -p'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gcam='git commit --amend -m'
alias gcan='git commit --amend --no-edit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout main || git checkout master'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdw='git diff --word-diff'
alias gds='git diff --stat'
alias gf='git fetch'
alias gfa='git fetch --all --prune --tags'
alias gl='git log --oneline --decorate --graph --all -15'
alias gll='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gm='git merge'
alias gmnff='git merge --no-ff'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gps='git push'
alias gpsf='git push --force-with-lease'
alias gpsu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gr='git remote -v'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grs='git reset'
alias grsh='git reset --hard'
alias gst='git status -sb'
alias gss='git status -s'
alias gsh='git show'
alias gsta='git stash'
alias gstap='git stash apply'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gt='git tag'
alias gtd='git tag -d'

# -----------------------------------------------------------------------------
# UTILITIES
# -----------------------------------------------------------------------------
alias clr='clear'
alias cls='clear'
alias h='history'
alias hgrep='history | grep'
alias htail='history | tail'
alias bc='bc -lq'
alias weather='curl wttr.in'
alias serve='python3 -m http.server'
alias wgetc='wget -c'
alias calnow='cal -m3'

# Exit shortcuts
alias q='exit'
alias :q='exit'
alias bye='exit'

# Ping shortcuts
alias pingg='ping -c 5 google.com'
alias pingcf='ping -c 5 1.1.1.1'

# System control
alias rebootnow='sudo reboot'
alias shutdownnow='sudo shutdown -h now'

# Shell config management
alias reload!='source ~/.bashrc && echo "Bash config reloaded!"'
alias src='source ~/.bashrc'
alias listaliases="alias | sort | less"

# Other tools
alias gem='npx @google/gemini-cli@latest'

# -----------------------------------------------------------------------------
# PRINTING (Brother DCP-L2550DW)
# -----------------------------------------------------------------------------
alias lp='lp -d DCP-L2550DW'
alias lpq='lpq -P DCP-L2550DW'
alias lprm='lprm -P DCP-L2550DW'
alias lpstat='lpstat -p'
alias printers='lpstat -a'
alias print2='lp -d DCP-L2550DW -n 2'
alias printduplex='lp -d DCP-L2550DW -o sides=two-sided-long-edge'
alias printlandscape='lp -d DCP-L2550DW -o landscape'
alias pdf='lp -d cups-pdf'
alias mergepdf='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf'

# -----------------------------------------------------------------------------
# CLIPBOARD CAPTURE (t, c, tc functions)
# -----------------------------------------------------------------------------
unalias t c tc 2>/dev/null

_copy_to_clipboard() {
    local file=$1
    if command -v wl-copy >/dev/null; then
        for i in {1..2}; do
            if timeout 2s wl-copy < "$file" 2>/dev/null; then
                echo "Copied to clipboard"
                return 0
            fi
            sleep 0.2
        done
        echo "Clipboard copy timed out"
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
    echo "Saved to $file"
    return $status
}

# -----------------------------------------------------------------------------
# HELPER FUNCTIONS
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

# Print functions
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
