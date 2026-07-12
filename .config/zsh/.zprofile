export PROFILE_SOURCED=1
path+=('/usr/local/bin')
path+=('/Users/sadarealam/Library/Python/3.9/bin')
path+=('/Users/sadarealam/Library/Android/sdk/platform-tools')
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
