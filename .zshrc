export zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi wait lucid light-mode for \
  pick'z.sh' z-shell/z \
  OMZ::plugins/git/git.plugin.zsh \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  OMZ::plugins/git-extras/git-extras.plugin.zsh \
  OMZ::plugins/common-aliases/common-aliases.plugin.zsh \
  pick'zsh-nvm.plugin.zsh' lukechilds/zsh-nvm \
  as'completion' blockf zsh-users/zsh-completions \
  atinit'zicompinit; zicdreplay' z-shell/fast-syntax-highlighting

zi ice lucid wait'2'
zi light z-shell/history-search-multi-word

zi wait'3' lucid light-mode for \
  as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer \
  as'program' from'gh-r' mv'yarn* -> yarn' pick"yarn/bin/yarn" bpick'*.tar.gz' yarnpkg/yarn \
  as'program' from'gh-r' bpick'*x86_64-apple-darwin.tar.gz' mv'dua-* -> dua' pick'dua/dua' Byron/dua-cli \
  as'program' from'gh-r' atclone'ln -sfv completions/exa.zsh _exa' atpull'%atclone' pick'bin/exa' ogham/exa \
  as'program' from'gh-r' atclone'ln -sfv completions/dog.zsh _dog' atpull'%atclone' pick'bin/dog' ogham/dog \
  as'program' from'gh-r' mv'direnv* -> direnv' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick'direnv' src='zhook.zsh' direnv/direnv \
  as'program' from'gh-r' mv'autok3s* -> autok3s' atclone'./autok3s completion zsh > autok3s.zsh && ln -sfv autok3s.zsh _autok3s' atpull'%atclone' pick'autok3s' cnrancher/autok3s


eval "$(starship init zsh)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/.{extra,path,exports,functions,dockerfunctions,kubefunctions,cli-packages,aliases,source}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
