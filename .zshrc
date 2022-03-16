
eval "$(starship init zsh)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/.{extra,path,exports,functions,dockerfunctions,kubefunctions,cli-packages,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

autoload -U +X compinit && compinit
source ~/.dotfiles/.source

export zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi wait lucid light-mode for \
  z-shell/z \
  OMZP::git-extras \
  OMZP::common-aliases \
  OMZ::plugins/git/git.plugin.zsh \
  djui/alias-tips \
  lukechilds/zsh-nvm \
  as"completion" blockf zsh-users/zsh-completions \
  atinit"zicompinit; zicdreplay" z-shell/fast-syntax-highlighting

zi ice lucid wait"2"
zi light z-shell/history-search-multi-word

zi from"gh-r" as"program" mv"direnv* -> direnv" \
  atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
  pick"direnv" src="zhook.zsh" for \
    direnv/direnv
