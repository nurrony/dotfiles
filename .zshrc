
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
  OMZP::common-aliases \
  OMZP::nvm \
  OMZP::git-extras \
  OMZP::colored-man-pages \
  djui/alias-tips \
  z-shell/z \
  voronkovich/gitignore.plugin.zsh \
  as"completion" blockf zsh-users/zsh-completions \
  atinit"zicompinit; zicdreplay" z-shell/fast-syntax-highlighting
