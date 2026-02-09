# Atuin (shell history)
[ -s "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
command -v atuin &>/dev/null && eval "$(atuin init bash)"
