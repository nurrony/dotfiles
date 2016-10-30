#!/usr/bin/env bash
cd $HOME && \
printf "\npreparing your new Mac for awesomeness!!\n\n"
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  echo "Homebrew not found installing it for you..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" >/dev/null 2>&1
else
  echo 'Updating Homebrew...'
  brew update >/dev/null 2>&1
fi

brew install zsh
# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
fi;

#Install Oh-My-ZSH
echo 'Installing Oh My Zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null 2>&1 && \
#Install Shell plugins
echo "installing custom plugins"
brew install thefuck >/dev/null 2>&1
mkdir -p ~/.oh-my-zsh/custom/plugins && cd $_ &&  \
git clone https://github.com/djui/alias-tips.git >/dev/null 2>&1 && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting >/dev/null 2>&1 && \
cd $HOME && \
curl -SsLo hostess https://github.com/cbednarski/hostess/releases/download/v0.2.0/hostess_darwin_amd64 >/dev/null 2>&1 && \
sudo mv hostess /usr/local/bin/ && sudo chmod +x /usr/local/bin/hostess
mkdir $HOME/.marker && cd $HOME/.marker && \
git clone https://github.com/pindexis/marker . >/dev/null 2>&1 && ./install.py && cd $HOME && rm -fr .marker

# clone .dotfile
rm -fr $HOME/.dotfiles/.git && \
mv .zshrc .zshrc.pre-nurrony-dotfiles && cp $HOME/.dotfiles/.zshrc $HOME && \
ln -s $HOME/.dotfiles/.{gitignore,gitconfig,gitattributes,gemrc,inputrc,curlrc,gvimrc,hushlogin,wgetrc,screenrc} $HOME/
echo 'All are done. Applying changes..'
source $HOME/.zshrc
printf "\nTo prepare your pc more developer friendly you can run the following scripts\n\n"
printf 'chmod +x ./brew.sh && ./brew.sh\n\n'

printf "To customise your macOS installation according to most developer\'s preferences run the following command\n"

printf 'chmod +x ./macos.sh && ./macos.sh\n\n'

echo 'Happy Hacking!!!'
