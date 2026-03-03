[[ $- == *i* ]] || return 0

if [[ ! -f ~/.blesh/ble.sh ]]; then
  echo "ble.sh not found at ~/.blesh/ble.sh"
  echo "Install: git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git /tmp/ble.sh-build && make -C /tmp/ble.sh-build INSDIR=~/.blesh install && rm -rf /tmp/ble.sh-build"
  return
fi

if [[ ${BLE_VERSION-} ]]; then
    ble-attach
else
    source ~/.blesh/ble.sh --attach=prompt
fi

# fzf key bindings via ble.sh integration (Ctrl-R history, Ctrl-T file, Alt-C cd)
command -v fzf >/dev/null 2>&1 && ble-import contrib/fzf-key-bindings
