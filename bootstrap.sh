#!/usr/bin/env bash
echo "==> Installing Zsh and set is as default login shell..." && \
brew install zsh
# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
fi;

cd $HOME && \
rm -fr $HOME/.dotfiles/.git && \
mv .zshrc .zshrc.pre-nurrony-dotfiles && \
ln -sf $HOME/.dotfiles/.{zshrc,curlrc,gemrc,gitattribute,gitconfig,gitignore,wgetrc,inputrc,screenrc,hushlogin} $HOME/

ln -sf $HOME/.dotfiles/{tmux,alacritty,zellij,skhd,yabai} $HOME/.config/
echo "Creating '~/.dotfiles/.extra' file to write custom configurations that you might not want to share"
touch $HOME/.dotfiles/.extra
echo "Installing Homebrew formulas and VSCode extensions..."
brew bundle install --file=$HOME/.dotfiles/Brewfile
echo "==> All setup done."
echo
printf "To customise your macOS installation according to most developer\'s preferences run the following command\n"
printf 'chmod +x ./.macos && ./.macos\n\n'
printf 'INFORMATION: Please create .extra in you HOME directory to override or for customizing configurations'
echo '🚀🚀 Please restart your terminal and Happy Hacking 🚀🚀'
