# terminal color settings
set termguicolors

# uncomment these lines if you are using powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/.{zsh_options,extra,exports,path,source,aliases,functions,containerfunctions,kubefunctions,cli-packages}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# load zinit plugin manager. See https://github.com/zdharma-continuum/zinit.git
ZINIT_HOME="${${XDG_DATA_HOME:-$DEV_ZONE_CONFIG_PATH}:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# load essential completion
zinit lucid light-mode for \
  as'completion' zsh-users/zsh-completions \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  as'program' from'gh-r' atclone'./zoxide init --cmd=j zsh > init.zsh' src'init.zsh' atpull'%atclone' pick'zoxide/zoxide' ajeetdsouza/zoxide \
  as'program' from'gh-r' mv'mise* -> mise' atclone'./mise completion zsh > _mise && ./mise activate zsh > init.zsh' src'init.zsh' atpull'%atclone' jdx/mise

# install oh my zsh plugins as snippets
zinit wait'3' lucid light-mode for \
  OMZP::git \
  OMZP::mvn \
  OMZP::sudo \
  OMZP::ansible \
  OMZP::extract \
  OMZP::command-not-found \
  zdharma-continuum/history-search-multi-word \
  zdharma/fast-syntax-highlighting \
  as'completion' pick'_curl' Valodim/zsh-curl-completion

zinit wait'10' lucid light-mode for \
  as'program' from'gh-r' jdx/usage \
  as'program' from'gh-r' medialab/xan \
  as'program' from'gh-r' danielmiessler/Fabric \
  as'program' from'gh-r' mv'hostess* -> hostess' cbednarski/hostess \
  as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer \
  as'program' from'gh-r' atclone'ln -sfv completions/dog.zsh _dog' atpull'%atclone' pick'bin/dog' ogham/dog \
  as'program' from'gh-r' atpull'%atclone' pick'phpactor.phar' mv'phpactor.phar* -> phpactor' phpactor/phpactor


#----------------------------------------------------------------
# THEMES
# - starship: https://starship.rs/
# - OhMyPosh: https://ohmyposh.dev/
# - powerlevel10k: https://github.com/romkatv/powerlevel10k
#
# Note: Uncomment only the theme that you want to use.
#-----------------------------------------------------------------

# install and load starship theme.
# zi ice as"command" from"gh-r" \
#   atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship;" \
#   atpull"%atclone" src"init.zsh"
# zi light starship/starship

# install and load ohmyposh theme
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   zi ice as"command" from"gh-r" mv'posh-* -> oh-my-posh' \
#     atclone"./oh-my-posh completion zsh > _oh_my_posh" \
#     atpull"%atclone" atload'eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/.config/ohmyposh/zen.toml)"'
#   zi light JanDeDobbeleer/oh-my-posh
# fi

# install powerline10k
zinit ice depth'1' atload"[[ ! -f $HOME/.dotfiles/.config/p10k/p10k.zsh ]] || source $HOME/.dotfiles/.config/p10k/p10k.zsh" nocd
zinit light romkatv/powerlevel10k

# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit && compinit
zi cdreplay -q
