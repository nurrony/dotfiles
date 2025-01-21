# Powerlevel10k prompt segments for mise
# [Feature request: add segment for mise](https://github.com/romkatv/powerlevel10k/issues/2212)
# Usage in ~/.zshrc:
#   [[ -f ~/.config/shell/p10k.mise.zsh ]] && source ~/.config/shell/p10k.mise.zsh

() {
  function prompt_mise() {
    local plugins=("${(@f)$(mise ls --current --offline 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" && $3!="$MISE_CONFIG_DIR/config.toml" && $3!="(missing)" {if ($1) print $1, $2}')}")
    local plugin
    for plugin in ${(k)plugins}; do
      local parts=("${(@s/ /)plugin}")
      local tool=${(U)parts[1]}
      local version=${parts[2]}
      p10k segment -r -i "${tool}_ICON" -s $tool -t "$version"
    done
  }
  # icons
  typeset -g POWERLEVEL9K_YARN_ICON=''
  typeset -g POWERLEVEL9K_PYTHON_ICON=''
  typeset -g POWERLEVEL9K_ELIXIR_ICON=''
  typeset -g POWERLEVEL9K_ERLANG_ICON=''
  typeset -g POWERLEVEL9K_MISE_LUA_ICON=''
  typeset -g POWERLEVEL9K_MISE_PHP_ICON=''
  typeset -g POWERLEVEL9K_MISE_DENO_ICON='󰯵'
  typeset -g POWERLEVEL9K_MISE_NODE_ICON=''
  typeset -g POWERLEVEL9K_MISE_PERL_ICON=''
  typeset -g POWERLEVEL9K_MISE_JAVA_ICON=''
  typeset -g POWERLEVEL9K_MISE_RUST_ICON=''
  typeset -g POWERLEVEL9K_MISE_DART_ICON=''
  typeset -g POWERLEVEL9K_MISE_RUBY_ICON=''
  typeset -g POWERLEVEL9K_MISE_MAVEN_ICON=''
  typeset -g POWERLEVEL9K_MISE_JULIA_ICON=''
  typeset -g POWERLEVEL9K_MISE_SCALA_ICON=''
  typeset -g POWERLEVEL9K_MISE_PYTHON_ICON=''
  typeset -g POWERLEVEL9K_MISE_GRADLE_ICON=''
  typeset -g POWERLEVEL9K_MISE_PACKAGE_ICON='󰏗'
  typeset -g POWERLEVEL9K_MISE_HASKELL_ICON=''
  typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_ICON=''

# Colors
  typeset -g POWERLEVEL9K_MISE_FOREGROUND=#43302E
  typeset -g POWERLEVEL9K_MISE_BACKGROUND=#95ffa5

  ## background
  typeset -g POWERLEVEL9K_MISE_LUA_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_PHP_BACKGROUND=5
  typeset -g POWERLEVEL9K_MISE_RUBY_BACKGROUND=1
  typeset -g POWERLEVEL9K_MISE_PERL_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_JULIA_BACKGROUND=2
  typeset -g POWERLEVEL9K_MISE_ELIXIR_BACKGROUND=5
  typeset -g POWERLEVEL9K_MISE_ERLANG_BACKGROUND=1
  typeset -g POWERLEVEL9K_MISE_RUST_BACKGROUND=208
  typeset -g POWERLEVEL9K_MISE_DENO_BACKGROUND=222
  typeset -g POWERLEVEL9K_MISE_JAVA_BACKGROUND=213
  typeset -g POWERLEVEL9K_MISE_HASKELL_BACKGROUND=3
  typeset -g POWERLEVEL9K_MISE_FLUTTER_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_POSTGRES_BACKGROUND=6
  typeset -g POWERLEVEL9K_MISE_GRADLE_BACKGROUND=150
  typeset -g POWERLEVEL9K_MISE_MAVEN_BACKGROUND=#88307b
  typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_BACKGROUND=5
  typeset -g POWERLEVEL9K_MISE_YARN_BACKGROUND=#C1BDEB
  typeset -g POWERLEVEL9K_MISE_PYTHON_BACKGROUND=#FFD43B

  # foreground
  typeset -g POWERLEVEL9K_MISE_PYTHON_FOREGROUND=23
  typeset -g POWERLEVEL9K_MISE_YARN_FOREGROUND=#2e2867
  typeset -g POWERLEVEL9K_MISE_MAVEN_FOREGROUND=#CCCCCC
  typeset -g POWERLEVEL9K_MISE_GRADLE_FOREGROUND=#212121


  typeset -g POWERLEVEL9K_MISE_GRADLE_SHOW_ON_UPGLOB='*.gradle'
  typeset -g POWERLEVEL9K_MISE_DENO_SHOW_ON_UPGLOB='deno.json|deno.jsonc'
  typeset -g POWERLEVEL9K_MISE_MAVEN_SHOW_ON_UPGLOB='pom.xml|mvnw|mvnw.cmd'
  typeset -g POWERLEVEL9K_MISE_NODE_SHOW_ON_UPGLOB='*.js|*.ts|package.json|.nvmrc|pnpm-workspace.yaml|.pnpmfile.cjs|.vue|yarn.lock'
  typeset -g POWERLEVEL9K_MISE_JAVA_SHOW_ON_UPGLOB='*.java|*.class|*.gradle|*.jar|*.clj|*.cljr|pom.xml|build.gradle.kts|build.sbt|.java-version|*.deps.edn|project.clj|build.boot'
}
