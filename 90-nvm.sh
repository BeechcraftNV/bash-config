# NVM (Node Version Manager) Lazy Load
export NVM_DIR="$HOME/.nvm"

_load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# Lazy load triggers
nvm() {
    unset -f nvm node npm npx
    _load_nvm
    nvm "$@"
}

node() {
    unset -f nvm node npm npx
    _load_nvm
    node "$@"
}

npm() {
    unset -f nvm node npm npx
    _load_nvm
    npm "$@"
}

npx() {
    unset -f nvm node npm npx
    _load_nvm
    npx "$@"
}