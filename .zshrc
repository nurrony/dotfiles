# enable zi https://wiki.zshell.dev/
typeset -A ZI
ZI[BIN_DIR]="${HOME}/.zi/bin"
source "${ZI[BIN_DIR]}/zi.zsh"

zi ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zi light starship/starship

zi wait lucid light-mode for \
  as'completion' zsh-users/zsh-completions \
  as'completion' pick'gradle-completion.plugin.zsh' gradle/gradle-completion \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' atclone'./zoxide init --cmd=j zsh > init.zsh' src'init.zsh' atpull'%atclone' pick'zoxide/zoxide' ajeetdsouza/zoxide

zi wait'3' lucid light-mode for \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  OMZP::mvn \
  OMZP::git \
  as'program' from'gh-r' mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick'direnv' src'zhook.zsh' direnv/direnv

zi ice wait'3' lucid as'program' src'asdf.sh'
zi light asdf-vm/asdf

zi wait'5' lucid light-mode for \
  as'program' from'gh-r' atclone'ln -sfv completions/exa.zsh _exa' atpull'%atclone' pick'bin/exa' ogham/exa \
  as'program' atclone'ln -sfv etc/git-extras-completion.zsh _git-extras' atpull'%atclone' pick'$ZPFX/bin/git-*' make'PREFIX=$ZPFX' nocompile tj/git-extras

zi wait'10' lucid light-mode for \
  as'program' from'gh-r' jesseduffield/lazygit \
  as'program' from'gh-r' mv'tealdeer* -> tldr' dbrgn/tealdeer \
  as'program' from'gh-r' mv'mkcert* -> mkcert' FiloSottile/mkcert \
  as'program' from'gh-r' mv'hadolint* -> hadolint' hadolint/hadolint \
  as'program' from'gh-r' mv'yt-dlp* -> yt-dlp' bpick'yt-dlp_macos' yt-dlp/yt-dlp \
  as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer \
  as'program' from'gh-r' mv'cs* -> coursier' bpick'cs-*-apple-darwin.gz' coursier/coursier \
  as'program' from'gh-r' mv'hostess* -> hostess' bpick'hostess_macos_amd64' cbednarski/hostess \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' mv'dua-* -> dua' pick'dua/dua' Byron/dua-cli \
  as'program' from'gh-r' atclone'ln -sfv completions/dog.zsh _dog' atpull'%atclone' pick'bin/dog' ogham/dog \
  as'program' from'gh-r' mv'k3d* -> k3d' atclone'./k3d completion zsh > _k3d' atpull'%atclone' pick'k3d' k3d-io/k3d \
  as'program' from'gh-r' mv'krew* -> krew' atclone'./krew completion zsh > _krew' atpull'%atclone' kubernetes-sigs/krew \
  as'program' from'gh-r' mv'terraformer* -> terraformer' bpick'terraformer-all-darwin-amd64' GoogleCloudPlatform/terraformer \
  as'program' from'gh-r' mv'kind* -> kind' atclone'./kind completion zsh > _kind' atpull'%atclone' pick'kind' kubernetes-sigs/kind \
  as'program' from'gh-r' mv'argocd* -> argocd' atclone'./argocd completion zsh > _argocd' atpull'%atclone' pick'argocd' argoproj/argo-cd \
  as'program' from'gh-r' mv'skaffold* -> skaffold' atclone'./skaffold completion zsh > _skaffold' atpull'%atclone' GoogleContainerTools/skaffold \
  pick'git-open.plugin.zsh' paulirish/git-open \
  OMZP::extract \
  z-shell/H-S-MW \
  z-shell/F-Sy-H

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/.{extra,path,exports,aliases,functions,dockerfunctions,kubefunctions,source,cli-packages,zsh_options}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# Next two lines must be below the above two for zi autocomplete
autoload -Uz compinit
compinit
zi cdreplay -q
