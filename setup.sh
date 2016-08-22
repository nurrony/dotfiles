#!/usr/bin/env bash
sudo apt-get -y install zsh && \
sudo chsh -s $(which zsh) && \
#Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
#Install Shell plugins
mkdir -p ~/.oh-my-zsh/custom/plugins && cd $_ &&  \
git clone https://github.com/djui/alias-tips.git && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
cd $HOME && \
curl -SsLo hostess https://github.com/cbednarski/hostess/releases/download/v0.2.0/hostess_linux_amd64 && \
sudo mv hostess /usr/local/bin/ && sudo chmod +x /usr/local/bin/hostess && \
sudo -H pip3 install thefuck
mkdir $HOME/.marker && cd $HOME/.marker && \
git clone https://github.com/pindexis/marker . && ./install.py
rm -fr $HOME/.git
