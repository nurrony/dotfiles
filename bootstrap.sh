#!/usr/bin/env bash
echo "Installing Zsh and set is as default login shell..." && \
brew install zsh
# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
fi;

#Install Oh-My-ZSH
echo -ne 'Installing Oh My Zsh... '
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null 2>&1 && \
echo 'done' && \
echo -ne 'Installing PowerLevel9k theme...'
git clone --depth=1 https://github.com/romkatv/powerlevel10k ~/.oh-my-zsh/custom/themes/powerlevel10k  2>&1 && \
echo 'done' && \
#Install Shell plugins
echo -ne "installing custom plugins: thefuck, alias-tips, zsh-syntax-highlighting, hostess... "
brew install thefuck hostess >/dev/null 2>&1
mkdir -p ~/.oh-my-zsh/custom/plugins && cd $_ &&  \
git clone https://github.com/djui/alias-tips.git >/dev/null 2>&1 && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting >/dev/null 2>&1 && \
cd $HOME && \
echo -ne 'Installing NVM... '
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash 2>&1 && \
echo 'done'
# clone .dotfile
rm -fr $HOME/.dotfiles/.git && \
mv .zshrc .zshrc.pre-nurrony-dotfiles && \
ln -sf $HOME/.dotfiles/.{zshrc,p10k.zsh,curlrc,gemrc,cli-packages,gitattribute,gitconfig,gitignore,gvimrc,hgignore,hushlogin,inputrc,screenrc,spectacles-keymap,vimrc,wgetrc} $HOME/
echo 'All are done. Applying changes..'
source $HOME/.zshrc && \
printf "\nTo prepare your pc more developer friendly you can run the following scripts\n\n"
printf 'chmod +x ./brew.sh && ./brew.sh\n\n'

printf "To customise your macOS installation according to most developer\'s preferences run the following command\n"

printf 'chmod +x ./.macos && ./.macos\n\n'

echo 'Happy Hacking!!!'
