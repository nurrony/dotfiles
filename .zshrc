eval "$(starship init zsh)"

export zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi wait lucid light-mode for \
  as'completion' zsh-users/zsh-completions

zi wait'5' lucid light-mode for \
  z-shell/H-S-MW \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  paulirish/git-open\
  OMZ::plugins/git/git.plugin.zsh \
  OMZ::plugins/extract/extract.plugin.zsh \
  z-shell/F-Sy-H

zi ice wait'3' lucid as'program' src'asdf.sh'
zi light asdf-vm/asdf

zi wait'3' lucid light-mode for \
  as'program' from'gh-r' extrawurst/gitui \
  as'program' from'gh-r' mv'tealdeer* -> tldr' dbrgn/tealdeer \
  as'program' from'gh-r' mv'hadolint* -> hadolint' hadolint/hadolint \
  as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' mv'dua-* -> dua' pick'dua/dua' Byron/dua-cli \
  as'program' from'gh-r' atclone'ln -sfv completions/exa.zsh _exa' atpull'%atclone' pick'bin/exa' ogham/exa \
  as'program' from'gh-r' atclone'ln -sfv completions/dog.zsh _dog' atpull'%atclone' pick'bin/dog' ogham/dog \
  as'program' from'gh-r' mv'k3d* -> k3d' atclone'./k3d completion zsh > _k3d' atpull'%atclone' pick'k3d' k3d-io/k3d \
  as'program' from'gh-r' atclone'./hostctl completion zsh > _hostctl' atpull'%atclone' bpick'*macOS_64-bit.tar.gz' guumaster/hostctl \
  as'program' from'gh-r' mv'argocd* -> argocd' atclone'./argocd completion zsh > _argocd' atpull'%atclone' pick'argocd' argoproj/argo-cd \
  as'program' from'gh-r' mv'autok3s* -> autok3s' atclone'./autok3s completion zsh > _autok3s' atpull'%atclone' pick'autok3s' cnrancher/autok3s \
  as'program' from'gh-r' mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick'direnv' src'zhook.zsh' direnv/direnv \
  as'program' atclone'ln -sfv etc/git-extras-completion.zsh _git-extras' atpull'%atclone' pick'$ZPFX/bin/git-*' make'PREFIX=$ZPFX' nocompile tj/git-extras \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' atclone'./zoxide init --cmd=zz zsh > init.zsh' src'init.zsh' atpull'%atclone' pick'zoxide/zoxide' ajeetdsouza/zoxide

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/.{extra,path,exports,aliases,functions,dockerfunctions,kubefunctions,source,cli-packages}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

zicompinit; zicdreplay
