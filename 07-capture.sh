# -----------------------------------------------------------------------------
# CAPTURE FUNCTIONS (cap, blk, cblk)
# Clipboard capture and visual block delimiters for command output.
# Clipboard: OSC 52 over SSH, wl-copy (Wayland) locally, xclip as X11 fallback.
# -----------------------------------------------------------------------------

_cap_copy() {
    local file=$1
    if [[ -n "$SSH_CONNECTION" ]]; then
        # Remote SSH: use OSC 52 to push clipboard to local terminal emulator
        local b64
        b64=$(base64 < "$file" | tr -d '\n')
        printf "\e]52;c;%s\a" "$b64" > /dev/tty
    elif command -v wl-copy >/dev/null 2>&1; then
        wl-copy < "$file"
    elif command -v xclip >/dev/null 2>&1; then
        xclip -selection clipboard < "$file"
    else
        echo "cap: no clipboard tool found (install wl-copy or xclip)" >&2
        return 1
    fi
}

_blk_rule() {
    local cols=${COLUMNS:-$(tput cols 2>/dev/null || echo 80)}
    printf '─%.0s' $(seq 1 "$cols")
    echo
}

# cap — run a command, display output, and copy it to clipboard
cap() {
    if [ $# -eq 0 ]; then
        echo "Usage: cap <command> [args...]" >&2
        return 1
    fi
    local tmp
    tmp=$(mktemp)
    "$@" 2>&1 | tee "$tmp"
    local status=${PIPESTATUS[0]}
    _cap_copy "$tmp" && echo "✓ copied" >&2
    rm -f "$tmp"
    return $status
}

# blk — run a command with visible horizontal rule delimiters around output
blk() {
    if [ $# -eq 0 ]; then
        echo "Usage: blk <command> [args...]" >&2
        return 1
    fi
    _blk_rule
    "$@" 2>&1
    local status=$?
    _blk_rule
    return $status
}

# cblk — visual delimiters + clipboard copy in one call
cblk() {
    if [ $# -eq 0 ]; then
        echo "Usage: cblk <command> [args...]" >&2
        return 1
    fi
    local tmp
    tmp=$(mktemp)
    _blk_rule
    "$@" 2>&1 | tee "$tmp"
    local status=${PIPESTATUS[0]}
    _blk_rule
    _cap_copy "$tmp" && echo "✓ copied" >&2
    rm -f "$tmp"
    return $status
}
