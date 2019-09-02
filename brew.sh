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
brew install gnu-sed --with-default-names
# Install latest zsh.
# Note: don’t forget to add `/usr/local/bin/zsh` to `/etc/shells` before
# running `chsh`.
brew install zsh
brew install bash-completion2
brew install zsh-completions

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri


# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
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

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
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

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install git-extras
brew install git-secrets
# deletes unwanted file from git faster
brew install --ignore-dependencies bfg
brew install libiconv
brew install icu4c
brew install pkg-config
brew install cmake
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
# See here: https://github.com/BurntSushi/ripgrep
brew install ripgrep
brew install --ignore-dependencies yarn
brew install git-flow-avh

# Docker
# brew install docker
brew install docker-machine
# brew install docker-compose
brew install docker-machine-driver-xhyve
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

# Maven, Gradle ElasticBeanstalk and Ahoy
# brew tap devinci-code/tap
# brew install ahoy
brew install maven
brew install gradle

# AWS CLIs
brew tap aws/tap
brew install awscli
brew install aws-elasticbeanstalk
brew install aws-sam-cli

# Kubernetes
brew install kubectl
brew install kops
brew install kubernetes-helm
brew tap azure/draft
brew install draft # this also installs kubernetes-helm
# Installs tools with names kctx and kns to prevent prefix collision with kubectl name
brew install kubectx --with-short-names

# Install Dart SDK Dartium and Dart VM for web
brew tap dart-lang/dart
brew install dart --devel

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

# Lastpass
# brew install lastpass-cli --with-pinentry

# Remove outdated versions from the cellar.
brew cleanup


# CASK Install
brew update
brew tap caskroom/cask
brew tap caskroom/versions
brew cask install alfred
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install docker
brew cask install google-chrome
brew cask install gpg-suite
brew cask install iterm2
brew cask install minikube
brew cask install rocket-chat
brew cask install sequel-pro
brew cask install skype
brew cask install slack
brew cask install the-unarchiver
brew cask install vagrant
brew cask install vlc
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
brew cleanup
