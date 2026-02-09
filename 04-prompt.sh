# -----------------------------------------------------------------------------
# DEBIAN CHROOT DETECTION
# -----------------------------------------------------------------------------
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# -----------------------------------------------------------------------------
# COLOR DEFINITIONS
# -----------------------------------------------------------------------------
COLOR_RESET='\[\033[0m\]'
COLOR_USER='\[\033[1;32m\]'      # Green
COLOR_HOST='\[\033[1;31m\]'      # Red
COLOR_PATH='\[\033[1;33m\]'      # Yellow
COLOR_GIT='\[\033[1;35m\]'       # Magenta
COLOR_PROMPT='\[\033[1;36m\]'    # Cyan

# -----------------------------------------------------------------------------
# PROMPT
# -----------------------------------------------------------------------------
# Two-line prompt with git support
PS1="${debian_chroot:+($debian_chroot)}"
PS1+="${COLOR_USER}\u${COLOR_RESET}"
PS1+=" at ${COLOR_HOST}\h${COLOR_RESET}"
PS1+=" in ${COLOR_PATH}\w${COLOR_RESET}"
PS1+=" ${COLOR_GIT}\$(git_branch)${COLOR_RESET}"
PS1+="\n${COLOR_PROMPT}❯${COLOR_RESET} "

# Or a more minimal single-line version:
# PS1="${debian_chroot:+($debian_chroot)}${COLOR_PATH}\w${COLOR_RESET} ${COLOR_GIT}\$(git_branch)${COLOR_RESET}${COLOR_PROMPT}❯${COLOR_RESET} "

# -----------------------------------------------------------------------------
# XTERM TITLE
# -----------------------------------------------------------------------------
# Set terminal title to user@host:dir for xterm/rxvt
# Skip for WezTerm to avoid notification spam
if [[ "$TERM_PROGRAM" != "WezTerm" ]]; then
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    esac
fi
