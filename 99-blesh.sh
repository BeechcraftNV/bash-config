[[ $- != *i* ]] && return

if [[ ! -f ~/.blesh/ble.sh ]]; then
  echo "ble.sh not found at ~/.blesh/ble.sh"
  echo "Install: git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git /tmp/ble.sh-build && make -C /tmp/ble.sh-build INSDIR=~/.blesh install && rm -rf /tmp/ble.sh-build"
  return
fi

source ~/.blesh/ble.sh --noattach
ble-attach
