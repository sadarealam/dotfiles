/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&     \
eval "$(/opt/homebrew/bin/brew shellenv)" && \
brew install stow && \
stow . && \
brew install --cask alacritty  && \
brew install zellij && \
brew install starship && \
brew install --cask vlc && \
brew install --cask zed && \
brew install neovim && \
brew install --cask dbeaver-community && \
brew install --cask font-jetbrains-mono-nerd-font && \
brew install --cask intellij-idea && \
brew install zsh-autosuggestions && \
brew install zsh-syntax-highlighting && \
brew install eza && \
brew install z && \
brew install zoxide && \
brew install --cask openvpn-connect && \
brew install --cask claude-code && \
brew install --cask gitup-app && \
brew install dmno-dev/tap/varlock && \
brew install stats && \
brew install bruno && \
brew install --cask orbstack && \
brew install --cask arc && \
brew install --cask slack && \
brew install --cask logi-options+ && \
xattr -rd com.apple.quarantine /Applications/Alacritty.app && \
curl  -s "https://get.sdkman.io" | zsh
