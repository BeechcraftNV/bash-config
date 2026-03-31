# -----------------------------------------------------------------------------
# COLOR ALIASES
# -----------------------------------------------------------------------------
if command -v grep >/dev/null 2>&1; then
    alias grep='grep --color=auto'
    alias fgrep='grep -F --color=auto'
    alias egrep='grep -E --color=auto'
fi

# Alert for long running commands: sleep 10; alert
if command -v notify-send >/dev/null 2>&1; then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

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
alias lmde='ssh 192.168.29.43'
alias pool='cd /mnt/pool'
alias compose='cd /opt/docker/compose'
alias bin='cd /home/steven/.local/bin'
alias bashd='cd /home/steven/.bashrc.d'
alias bigpi='ssh 192.168.29.116'

# -----------------------------------------------------------------------------
# FILE LISTING (eza)
# -----------------------------------------------------------------------------
if command -v eza >/dev/null 2>&1; then
    alias ls='eza --group-directories-first'
    alias ll='eza -la --group-directories-first'
    alias la='eza -la --group-directories-first'
    alias lt='eza --tree --level=2'
    alias l.='eza -d .*'
else
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

# -----------------------------------------------------------------------------
# FILE OPERATIONS (safer defaults)
# -----------------------------------------------------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I --preserve-root'
alias mkdir='mkdir -pv'
alias ffind='find . -iname'

if command -v fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
elif command -v fd >/dev/null 2>&1; then
    alias fd='fd'
fi

if command -v batcat >/dev/null 2>&1; then
    alias ccat='batcat --paging=never'
elif command -v bat >/dev/null 2>&1; then
    alias ccat='bat --paging=never'
fi

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
alias path='echo "$PATH" | tr ":" "\n"'

# -----------------------------------------------------------------------------
# APT PACKAGE MANAGEMENT
# -----------------------------------------------------------------------------
if command -v apt >/dev/null 2>&1; then
    alias aptup='sudo apt update'
    alias aptupg='sudo apt update && sudo apt upgrade -y'
    alias aptin='sudo apt install'
    alias aptrm='sudo apt remove'
    alias aptsearch='apt search'
    alias aptclean='sudo apt autoremove && sudo apt autoclean'
fi

# -----------------------------------------------------------------------------
# DOCKER
# -----------------------------------------------------------------------------
if command -v docker >/dev/null 2>&1; then
    alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
    alias dpsinfo='docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"'
    alias dcu='docker compose up -d'
    alias dcd='docker compose down'
    alias dcl='docker compose logs -f'
fi

# -----------------------------------------------------------------------------
# GIT
# -----------------------------------------------------------------------------
if command -v git >/dev/null 2>&1; then
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
fi

# -----------------------------------------------------------------------------
# UTILITIES
# -----------------------------------------------------------------------------
alias clr='clear'
alias cls='clear'
alias h='history'
alias hgrep='history | grep'
alias htail='history | tail'
if command -v bc >/dev/null 2>&1; then
    alias bc='bc -lq'
fi
alias weather='curl wttr.in'
if command -v python3 >/dev/null 2>&1; then
    alias serve='python3 -m http.server'
fi
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
if command -v gemini >/dev/null 2>&1; then
    alias gem='gemini'
fi
if command -v npx >/dev/null 2>&1; then
    alias gemx='npx @google/gemini-cli'
    alias fresh-editor='npx @fresh-editor/fresh-editor@latest'
fi

# -----------------------------------------------------------------------------
# PRINTING (Brother DCP-L2550DW)
# -----------------------------------------------------------------------------
if command -v lp >/dev/null 2>&1; then
    alias lp='lp -d DCP-L2550DW'
    alias lpq='lpq -P DCP-L2550DW'
    alias lprm='lprm -P DCP-L2550DW'
    alias lpstat='lpstat -p'
    alias printers='lpstat -a'
    alias print2='lp -d DCP-L2550DW -n 2'
    alias printduplex='lp -d DCP-L2550DW -o sides=two-sided-long-edge'
    alias printlandscape='lp -d DCP-L2550DW -o landscape'
    alias pdf='lp -d cups-pdf'
fi
if command -v gs >/dev/null 2>&1; then
    alias mergepdf='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf'
fi
