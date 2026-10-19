# load essential completion
zinit lucid light-mode for \
  as'completion' zsh-users/zsh-completions \
  as'program' atpull'%atclone' atclone'cp ./hosts hostess && chmod +x ./hosts* && ./hosts completions install' pick'hosts' xwmx/hosts \
  as'program' from'gh-r' atclone'./zoxide init --cmd=j zsh > init.zsh' src'init.zsh' atpull'%atclone' pick'zoxide/zoxide' ajeetdsouza/zoxide \
  as'program' from'gh-r' extract'!' bpick'mise-*-macos-*.tar.gz' atclone'chmod +x ./bin/mise && ./bin/mise completion zsh > _mise && ./bin/mise activate zsh > init.zsh' src'init.zsh' atpull'%atclone' jdx/mise

# install oh my zsh plugins as snippets
zinit wait'2' lucid light-mode for \
  OMZP::git \
  OMZP::mvn \
  OMZP::sudo \
  OMZP::podman \
  OMZP::ansible \
  OMZP::extract \
  OMZP::command-not-found \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  as'completion' pick'_curl' Valodim/zsh-curl-completion \
  zdharma/fast-syntax-highlighting

zinit wait'10' lucid light-mode for \
  as'program' from'gh-r' jdx/usage \
  as'program' from'gh-r' medialab/xan \
  as'program' from'gh-r' danielmiessler/Fabric \
  as'program' from'gh-r' PHPantom-dev/phpantom_lsp \
  as'program' from'gh-r' pick'llmfit-*/llmfit' AlexsJones/llmfit \
  as'program' from'gh-r' atpull"%atclone" atclone'./doggo completions zsh > _doggo' pick'doggo*/doggo' mr-karan/doggo
