# terminal color settings
set termguicolors

# key bindings
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/.{zsh_options,extra,exports,path,aliases,functions,dockerfunctions,kubefunctions,source,cli-packages}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${${XDG_DATA_HOME:-$DEV_ZONE_CONFIG_PATH}:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit wait lucid light-mode for \
  as'completion' zsh-users/zsh-completions \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  as'completion' pick'gradle-completion.plugin.zsh' gradle/gradle-completion \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' atclone'./zoxide init --cmd=j zsh > init.zsh' src'init.zsh' atpull'%atclone' pick'zoxide/zoxide' ajeetdsouza/zoxide

zinit wait'3' lucid light-mode for \
  OMZP::git \
  OMZP::mvn \
  OMZP::extract \
  as'program' from'gh-r' mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick'direnv' src'zhook.zsh' direnv/direnv

zinit ice wait'3' lucid as'program' src'asdf.sh'
zinit light asdf-vm/asdf

zinit wait'10' lucid light-mode for \
  as'program' from'gh-r' nektos/act \
  as'program' from'gh-r' jesseduffield/lazygit \
  as'program' from'gh-r' mv'tealdeer* -> tldr' dbrgn/tealdeer \
  as'program' from'gh-r' mv'krew* -> krew' kubernetes-sigs/krew \
  as'program' from'gh-r' mv'mkcert* -> mkcert' FiloSottile/mkcert \
  as'program' from'gh-r' mv'hadolint* -> hadolint' hadolint/hadolint \
  as'program' from'gh-r' mv'yt-dlp* -> yt-dlp' bpick'yt-dlp_macos' yt-dlp/yt-dlp \
  as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer \
  as'program' from'gh-r' atclone'./txeh completion zsh > _txeh' atpull'%atclone' txn2/txeh \
  as'program' from'gh-r' mv'cs* -> coursier' bpick'cs-*-apple-darwin.gz' coursier/coursier \
  as'program' from'gh-r' atclone'./kondo --completions zsh > _kondo' atpull'%atclone' tbillington/kondo \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' mv'dua-* -> dua' pick'dua/dua' Byron/dua-cli \
  as'program' from'gh-r' atclone'ln -sfv completions/dog.zsh _dog' atpull'%atclone' pick'bin/dog' ogham/dog \
  as'program' from'gh-r' mv'k3d* -> k3d' atclone'./k3d completion zsh > _k3d' atpull'%atclone' pick'k3d' k3d-io/k3d \
  as'program' from'gh-r' mv'kind* -> kind' atclone'./kind completion zsh > _kind' atpull'%atclone' pick'kind' kubernetes-sigs/kind \
  as'program' from'gh-r' mv'argocd* -> argocd' atclone'./argocd completion zsh > _argocd' atpull'%atclone' pick'argocd' argoproj/argo-cd \
  as"program" atclone"make install PREFIX=$ZPFX" src'etc/git-extras-completion.zsh' atpull"%atclone" pick"$ZPFX/bin/git-*" tj/git-extras \
  as'program' from'gh-r' mv'skaffold* -> skaffold' atclone'./skaffold completion zsh > _skaffold' atpull'%atclone' GoogleContainerTools/skaffold \
  pick'git-open.plugin.zsh' paulirish/git-open \
  zdharma-continuum/history-search-multi-word \
  zdharma-continuum/fast-syntax-highlighting

#------------
#  THEMES
#------------

# install and load starship theme
# zi ice as"command" from"gh-r" \
#   atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#   atpull"%atclone" src"init.zsh"
# zi light starship/starship

# install powerline10k
zinit ice depth'1' atload"[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" nocd
zinit light romkatv/powerlevel10k

# install and load ohmyposh theme
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   zi ice as"command" from"gh-r" mv'posh-* -> oh-my-posh' \
#   atclone"./oh-my-posh completion zsh > _oh_my_posh" atpull"%atclone" atload'eval "$(oh-my-posh init zsh --config $HOME/.zen.omp.toml)"'
#   zi light JanDeDobbeleer/oh-my-posh
# fi


# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit && compinit
zi cdreplay -q
