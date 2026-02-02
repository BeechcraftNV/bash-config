# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load modular config from ~/.bashrc.d/
for f in ~/.bashrc.d/*.sh; do [ -r "$f" ] && source "$f"; done
. "$HOME/.cargo/env"

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
