# -----------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# -----------------------------------------------------------------------------
export GEMINI_MODEL="gemini-3-flash-preview"
export ZED_ALLOW_EMULATED_GPU=1

# export GEMINI_API_KEY=""

# -----------------------------------------------------------------------------
# NPM GLOBAL
# -----------------------------------------------------------------------------
[[ ":$PATH:" != *":$HOME/.npm-global/bin:"* ]] && export PATH="$HOME/.npm-global/bin:$PATH"

# -----------------------------------------------------------------------------
# PATH CLEANUP
# -----------------------------------------------------------------------------
# Deduplicate PATH entries, preserving order
PATH=$(awk -v RS=: -v ORS=: '!seen[$0]++' <<< "$PATH" | sed 's/:$//')
# Ensure ~/.local/bin is present
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"
export PATH
