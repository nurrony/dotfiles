eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/.{extra,path,exports,functions,dockerfunctions,kubefunctions,cli-packages,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(alias-tips \
# common-aliases \
# docker-compose \
# extract \
# git \
# git-extras \
# last-working-dir \
# macos \
# ssh-agent \
# terraform \
# urltools \
# zsh-z \
# zsh-syntax-highlighting)


# source $ZSH/oh-my-zsh.sh

# ssh-agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on

# User configuration

source ~/.dotfiles/.source

autoload -U compinit;
compinit
