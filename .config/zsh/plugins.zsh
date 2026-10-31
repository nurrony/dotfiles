# load essential completion
zinit lucid light-mode for \
  as'completion' zsh-users/zsh-completions

# install oh my zsh plugins as snippets
zinit wait'2' lucid light-mode for \
  OMZP::git \
  OMZP::mvn \
  OMZP::sudo \
  OMZP::podman \
  OMZP::extract \
  OMZP::command-not-found \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  as'completion' pick'_curl' Valodim/zsh-curl-completion \
  zdharma/fast-syntax-highlighting
