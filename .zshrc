# terminal color settings
set termguicolors

# key bindings
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# uncomment these lines if you are using powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/.{zsh_options,extra,exports,path,source,aliases,functions,dockerfunctions,kubefunctions,cli-packages}; do
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
  as'completion' pick'gradle-completion.plugin.zsh' gradle/gradle-completion \
  OMZP::git \
  OMZP::mvn \
  OMZP::ansible \
  OMZP::extract \
  as'program' from'gh-r' jdx/usage \
  as'program' from'gh-r' mv'krew* -> krew' kubernetes-sigs/krew \
  as'program' from'gh-r' mv'hostess* -> hostess' cbednarski/hostess \
  as'program' from'gh-r' mv'hadolint* -> hadolint' hadolint/hadolint \
  as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer \
  as'program' from'gh-r' atclone'ln -sfv completions/dog.zsh _dog' atpull'%atclone' pick'bin/dog' ogham/dog \
  as'program' from'gh-r' atclone'./zoxide init --cmd=j zsh > init.zsh' src'init.zsh' atpull'%atclone' pick'zoxide/zoxide' ajeetdsouza/zoxide

# install and load necessary programs
zinit wait'3' lucid light-mode for \
  as'program' from'gh-r' mv'mise* -> mise' atclone'./mise completion zsh > _mise && ./mise activate zsh > init.zsh' src'init.zsh' atpull'%atclone' jdx/mise \
  zdharma-continuum/history-search-multi-word \
  zdharma/fast-syntax-highlighting

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
#     atpull"%atclone" atload'eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/ohmyposh/zen.toml)"'
#   zi light JanDeDobbeleer/oh-my-posh
# fi

# install powerline10k
zinit ice depth'1' atload"[[ ! -f $HOME/.dotfiles/p10k/p10k.zsh ]] || source $HOME/.dotfiles/p10k/p10k.zsh" nocd
zinit light romkatv/powerlevel10k

# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit && compinit
zi cdreplay -q
