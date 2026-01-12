# -----------------------------------------------------------------------------
# HISTORY SETTINGS
# -----------------------------------------------------------------------------
# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# History length
HISTSIZE=1000
HISTFILESIZE=2000

# -----------------------------------------------------------------------------
# SHELL OPTIONS
# -----------------------------------------------------------------------------
# Check window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# Pattern "**" in pathname expansion matches all files and subdirectories
# shopt -s globstar

# -----------------------------------------------------------------------------
# LESSPIPE
# -----------------------------------------------------------------------------
# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# -----------------------------------------------------------------------------
# DIRCOLORS
# -----------------------------------------------------------------------------
# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
