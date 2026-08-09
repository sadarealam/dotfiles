#!/bin/bash
set -euo pipefail

# Skip every "Press RETURN/ENTER" and Y/n confirmation Homebrew would
# otherwise show (Homebrew installer, plus formulae like zellij/neovim/eza).
export NONINTERACTIVE=1

# Ask for the admin password once, up front, then keep the sudo ticket
# alive for the rest of the run so the Homebrew installer and any cask
# pkg-installers (openvpn-connect, logi-options+) can use it without
# prompting again.
sudo -v
(while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" 2>/dev/null || exit
done) &
SUDO_KEEPALIVE_PID=$!
trap 'kill "$SUDO_KEEPALIVE_PID" 2>/dev/null' EXIT

# --- Core setup: fail fast, everything else depends on this working ---
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
softwareupdate --install-rosetta --agree-to-license
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install stow
stow .

brew install dockutil
dockutil --remove all
dockutil --add '/System/Applications/Launchpad.app' --position 1

# --- Everything else: keep going even if one package fails ---
install_formula() {
  for pkg in "$@"; do
    brew install "$pkg" || echo "warning: failed to install formula $pkg" >&2
  done
}

install_cask() {
  for pkg in "$@"; do
    brew install --cask "$pkg" || echo "warning: failed to install cask $pkg" >&2
  done
}

FORMULAE=(
  zellij
  starship
  neovim
  zsh-autosuggestions
  zsh-syntax-highlighting
  eza
  z
  zoxide
  dmno-dev/tap/varlock
  stats
  bruno
)

CASKS=(
  alacritty
  vlc
  zed
  dbeaver-community
  font-jetbrains-mono-nerd-font
  intellij-idea
  openvpn-connect
  claude-code
  gitup-app
  orbstack
  arc
  slack
  logi-options+
)

install_formula "${FORMULAE[@]}"
install_cask "${CASKS[@]}"

xattr -rd com.apple.quarantine /Applications/Alacritty.app

curl -s "https://get.sdkman.io" | zsh
