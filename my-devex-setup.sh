#!/bin/bash

# Check if Homebrew is installed, probably not :)
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating homebrew..."
brew update

# Stuff I always need, sooner or later.
PACKAGES=(
    git
    go
    python
    node
    jump
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

CASKS=(
    visual-studio-code
    google-chrome
    slack
)

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

# Oh My Zsh
echo "Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Configuring Zsh..."
{
    echo "# Custom Aliases"
    echo "alias ll='ls -lah'"
    echo "alias l='ls -lah'"
    echo "alias gsta='git stash push'"
    echo "alias gstaa='git stash apply'"
    echo "alias gstall='git stash --all'"
    echo "alias gstc='git stash clear'"
    echo "alias gstd='git stash drop'"
    echo "alias gstl='git stash list'"
    echo "alias gstp='git stash pop'"
    echo "alias gsts='git stash show --text'"
    echo "alias gst='git status'"
    echo ""
    echo "# Custom Settings"
    echo "export PATH=\"/usr/local/bin:\$PATH\""
} >> ~/.zshrc

# Source .zshrc to apply changes
source ~/.zshrc

echo "Setup complete!"
