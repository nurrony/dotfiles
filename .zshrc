# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# DEFAULT_USER=$(whoami)
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator nvm time)
POWERLEVEL9K_NVM_BACKGROUND='magenta'
POWERLEVEL9K_NVM_FOREGROUND='green'
POWERLEVEL9K_KUBECONTEXT_BACKGROUND='blue'
POWERLEVEL9K_KUBECONTEXT_FOREGROUND='black'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868 %d.%m.%y}"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/.{extra,path,exports,aliases,functions,dockerfunctions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(alias-tips \
aws \
common-aliases \
extract \
gitfast \
git-extras \
last-working-dir \
npm \
nvm \
ssh-agent \
terraform \
urltools \
vagrant \
yarn \
z \
zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh
(command -v "ng" > /dev/null 2>&1) && source <(ng completion --zsh)
(command -v "kubectl" > /dev/null 2>&1) && source <(kubectl completion zsh)
(command -v "kops" > /dev/null 2>&1) && source <(kops completion zsh)
(command -v "minikube" > /dev/null 2>&1) && source <(minikube completion zsh)

# ssh-agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on

# zsh completion brew path fix
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -i
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# tmutil  listlocalsnapshotdates / |grep 20|while read f; do tmutil deletelocalsnapshots $f; done

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Volumes/Devzone/storage/npm/_npx/42491/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Volumes/Devzone/storage/npm/_npx/42491/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Volumes/Devzone/storage/npm/_npx/42491/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Volumes/Devzone/storage/npm/_npx/42491/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh