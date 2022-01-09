#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

brew install zsh
brew install bash-completion2
brew install zsh-completions
brew install starship

# Install `wget` with IRI support.
brew install wget
brew install httpie --HEAD

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install autoconf
brew install automake
brew install libtool
brew install pkg-config
brew install libyaml
brew install readline
brew install libksba
brew install openssl
brew install thefuck
brew install bat
brew install watch
brew install exa

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install dnsmasq
brew install fcrackzip
brew install foremost
brew install hashpump
# brew install hydra # brute force tool
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xz
brew install curl-openssl

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install git-extras
brew install git-secrets
brew install gitui

# deletes unwanted file from git faster
brew install --ignore-dependencies bfg
brew install libiconv
brew install icu4c
brew install pkg-config
brew install cmake
brew install fzf # fuzzy search find with superpower https://www.youtube.com/watch?v=qgG5Jhi_Els
brew install direnv # env for each dir 12factorapp
brew install go
brew install openssl
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install webkit2png
brew install zopfli
brew install zlib

# See here: https://github.com/BurntSushi/ripgrep
brew install ripgrep
brew install --ignore-dependencies yarn
brew install git-flow-avh

# Docker
brew install docker-machine

# brew tap devinci-code/tap
# brew install ahoy
brew install maven
brew install gradle

# AWS CLIs
brew tap aws/tap
brew install awscli
brew install aws-elasticbeanstalk
brew install aws-sam-cli
brew install cfn-lint

# AWLESS CLI
brew tap wallix/awless
brew install awless

# Docker
# Comes with Docker Desktop
# brew install docker-compose
# brew install docker-machine
# brew install docker-machine-completion
brew install docker-machine-driver-vmware

# Kubernetes
# Note: Replaced by autok3s

# brew install kubectl
# brew install kops
# brew install helm
# brew install minikube
# brew tap azure/draft
# brew install draft # this also installs kubernetes-helm
# Installs tools with names kctx and kns to prevent prefix collision with kubectl name


# Install Dart SDK Dartium and Dart VM for web
brew tap dart-lang/dart
brew install dart

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


# Azure CLI
brew install azure-cli

# Bitwarden
brew install bitwarden-cli

# Remove outdated versions from the cellar.
brew cleanup -s


# CASK Install
brew update --verbose
brew tap homebrew/cask
brew tap homebrew/cask-versions
brew install --cask alfred \
android-file-transfer \
appcleaner \
bitwarden \
brave-browser \
docker \
gpg-suite \
iterm2 \
skype \
the-unarchiver \
vagrant \
vagrant-vmware-utility \
vlc \
virtualbox \
virtualbox-extension-pack \
visual-studio-code
brew cleanup -s

# Install Kubernetes plugins
bash -c ./scripts/installers/krew
kubectl krew install tunnel ctx ns rbac-tool
