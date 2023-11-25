#!/usr/bin/env bash

# check if Homebrew is install or not
command -v brew >/dev/null 2>&1 || { echo "Homebrew is required. To install it, please check https://brew.sh. Aborting." >&2; exit 1; }

# Install brew dependencies
brew bundle --file=$HOME/.dotfiles/Brewfile

# AWLESS CLI
brew tap wallix/awless
brew install awless


# Kubernetes
# Note: Replaced by autok3s

# brew install minikube
# brew tap azure/draft
# brew install draft # this also installs kubernetes-helm
# Installs tools with names kctx and kns to prevent prefix collision with kubectl name

# Flutter packages
# Run these following after installing XCode
# sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
brew update --verbose
brew install --HEAD usbmuxd
brew link usbmuxd
brew install --HEAD libimobiledevice
brew install ideviceinstaller
brew install ios-deploy
brew install cocoapods
pod setup

# Install Kubernetes plugins
bash -c ./scripts/installers/krew
kubectl krew install tunnel ctx ns rbac-tool

# Remove outdated versions from the cellar.
brew autoremove && brew cleanup -s --prune=all
