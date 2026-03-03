# -----------------------------------------------------------------------------
# BASH COMPLETION
# -----------------------------------------------------------------------------
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# -----------------------------------------------------------------------------
# FZF
# -----------------------------------------------------------------------------
if command -v fzf >/dev/null 2>&1; then
    # fzf >= 0.48: unified --bash flag; fall back to legacy key-bindings path
    fzf --bash >/dev/null 2>&1 \
        && eval "$(fzf --bash)" \
        || { [[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && source /usr/share/doc/fzf/examples/key-bindings.bash; }
fi

# -----------------------------------------------------------------------------
# UV (Python package manager)
# -----------------------------------------------------------------------------
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion bash)"
