# Color definitions
COLOR_RESET='\[\033[0m\]'
COLOR_USER='\[\033[1;32m\]'      # Green
COLOR_HOST='\[\033[1;34m\]'      # Blue
COLOR_PATH='\[\033[1;33m\]'      # Yellow
COLOR_GIT='\[\033[1;35m\]'       # Magenta
COLOR_PROMPT='\[\033[1;36m\]'    # Cyan

# Cursor definitions
CURSOR_BLINK_UNDERLINE='\[\033[3 q\]'

# Two-line prompt with git support
PS1="${CURSOR_BLINK_UNDERLINE}${COLOR_USER}\u${COLOR_RESET}"
PS1+=" at ${COLOR_HOST}\h${COLOR_RESET}"
PS1+=" in ${COLOR_PATH}\w${COLOR_RESET}"
PS1+=" ${COLOR_GIT}\$(git_branch)${COLOR_RESET}"
PS1+="\n${COLOR_PROMPT}❯${COLOR_RESET} "

# Or a more minimal single-line version:
# PS1="${COLOR_PATH}\w${COLOR_RESET} ${COLOR_GIT}\$(git_branch)${COLOR_RESET}${COLOR_PROMPT}❯${COLOR_RESET} "
