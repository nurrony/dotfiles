eval "$(starship init zsh)"

export zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi wait lucid light-mode for \
  as'completion' blockf zsh-users/zsh-completions

zi wait'5a' lucid light-mode for \
  OMZ::plugins/git-extras/git-extras.plugin.zsh \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  z-shell/H-S-MW \
  pick'zsh-nvm.plugin.zsh' lukechilds/zsh-nvm

zi wait'5b' lucid light-mode for \
  as'program' from'gh-r' extrawurst/gitui \
  as'program' has'bat' pick'src/*' eth-p/bat-extras \
  as'program' from'gh-r' mv'tealdeer* -> tldr' dbrgn/tealdeer \
  as'program' from'gh-r' mv'hadolint* -> hadolint' hadolint/hadolint \
  as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer \
  as'program' from'gh-r' mv'yarn* -> yarn' pick"yarn/bin/yarn" bpick'*.tar.gz' yarnpkg/yarn \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' mv'dua-* -> dua' pick'dua/dua' Byron/dua-cli \
  as'program' from'gh-r' atclone'ln -sfv completions/exa.zsh _exa' atpull'%atclone' pick'bin/exa' ogham/exa \
  as'program' from'gh-r' atclone'ln -sfv completions/dog.zsh _dog' atpull'%atclone' pick'bin/dog' ogham/dog \
  as'program' from'gh-r' mv'k3d* -> k3d' atclone'./k3d completion zsh > _k3d' atpull'%atclone' pick'k3d' k3d-io/k3d \
  as'program' from'gh-r' mv'argocd* -> argocd' atclone'./argocd completion zsh > _argocd' atpull'%atclone' pick'argocd' argoproj/argo-cd \
  as'program' from'gh-r' mv'autok3s* -> autok3s' atclone'./autok3s completion zsh > _autok3s' atpull'%atclone' pick'autok3s' cnrancher/autok3s \
  as'program' from'gh-r' mv'hostess* -> hostess' atclone'./hostess completion zsh > _hostess' atpull'%atclone' pick'hostess' cbednarski/hostess \
  as'program' from'gh-r' mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick'direnv' src'zhook.zsh' direnv/direnv \
  as'program' atclone'ln -sfv etc/git-extras-completion.zsh _git-extras' atpull'%atclone' pick'$ZPFX/bin/git-*' make'PREFIX=$ZPFX' nocompile tj/git-extras \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' atclone'./zoxide init --cmd=j zsh > init.zsh' src'init.zsh' atpull'%atclone' mv'zoxide-* -> zoxide' pick'zoxide/zoxide' ajeetdsouza/zoxide

zi wait'3' lucid light-mode for \
  z-shell/F-Sy-H

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/.{extra,path,exports,functions,dockerfunctions,kubefunctions,cli-packages,aliases,source}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
