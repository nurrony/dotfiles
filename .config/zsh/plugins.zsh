# load zoxide
eval "$(zoxide init zsh --cmd cd)"

# load essential completion
zinit lucid light-mode for \
  as'completion' zsh-users/zsh-completions \
  as'program' from'gh-r' extract'!' bpick'mise-*-macos-*.tar.gz' atclone'chmod +x ./bin/mise && ./bin/mise completion zsh > _mise && ./bin/mise activate zsh > init.zsh' src'init.zsh' atpull'%atclone' jdx/mise


# install oh my zsh plugins as snippets
zinit wait'2' lucid light-mode for \
  OMZP::git \
  OMZP::mvn \
  OMZP::sudo \
  OMZP::podman \
  OMZP::extract \
  OMZP::command-not-found \
  as'program' from'gh-r' jdx/usage \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  as'completion' pick'_curl' Valodim/zsh-curl-completion \
  zdharma/fast-syntax-highlighting
