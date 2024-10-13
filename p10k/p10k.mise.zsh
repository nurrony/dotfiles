# Powerlevel10k prompt segments for mise
# [Feature request: add segment for mise](https://github.com/romkatv/powerlevel10k/issues/2212)
# Usage in ~/.zshrc:
#   [[ -f ~/.config/shell/p10k.mise.zsh ]] && source ~/.config/shell/p10k.mise.zsh

() {
  function prompt_mise() {
    local plugins=("${(@f)$(mise ls --current 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" {print $1, $2}')}")
    local plugin
    for plugin in ${(k)plugins}; do
      local parts=("${(@s/ /)plugin}")
      local tool=${(U)parts[1]}
      local version=${parts[2]}
      p10k segment -r -i "${tool}_ICON" -s $tool -t "$version"
    done
  }

  # Colors
  typeset -g POWERLEVEL9K_MISE_FOREGROUND=#43302E
  typeset -g POWERLEVEL9K_MISE_BACKGROUND=#95ffa5

  typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_BACKGROUND=5
  typeset -g POWERLEVEL9K_MISE_ELIXIR_BACKGROUND=5
  typeset -g POWERLEVEL9K_MISE_ERLANG_BACKGROUND=1
  typeset -g POWERLEVEL9K_MISE_FLUTTER_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_HASKELL_BACKGROUND=3
  typeset -g POWERLEVEL9K_MISE_JAVA_BACKGROUND=7
  typeset -g POWERLEVEL9K_MISE_JULIA_BACKGROUND=2
  typeset -g POWERLEVEL9K_MISE_LUA_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_PERL_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_PHP_BACKGROUND=5
  typeset -g POWERLEVEL9K_MISE_POSTGRES_BACKGROUND=6
  typeset -g POWERLEVEL9K_MISE_PYTHON_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_RUBY_BACKGROUND=1
  typeset -g POWERLEVEL9K_MISE_RUST_BACKGROUND=208

  # Ruby
  typeset -g POWERLEVEL9K_MISE_RUBY_FOREGROUND=#43302E
  typeset -g POWERLEVEL9K_MISE_RUBY_BACKGROUND=1

  # Python
  typeset -g POWERLEVEL9K_MISE_PYTHON_ICON=''
  typeset -g POWERLEVEL9K_MISE_PYTHON_BACKGROUND=121
  typeset -g POWERLEVEL9K_MISE_PYTHON_FOREGROUND=#43302E

  # Java
  typeset -g POWERLEVEL9K_MISE_GOLANG_BACKGROUND=4
  typeset -g POWERLEVEL9K_MISE_NODE_SHOW_ON_UPGLOB='*.java'
  typeset -g POWERLEVEL9K_MISE_GOLANG_FOREGROUND=#43302E

  # Node
  typeset -g POWERLEVEL9K_MISE_NODE_ICON=''
  typeset -g POWERLEVEL9K_MISE_NODE_SHOW_ON_UPGLOB='*.js|*.jsx|*.ts|*.tsx|*.vue|package.json'

  # Maven
  typeset -g POWERLEVEL9K_MISE_MAVEN_ICON=''
  typeset -g POWERLEVEL9K_MISE_MAVEN_FOREGROUND=#CCCCCC
  typeset -g POWERLEVEL9K_MISE_MAVEN_BACKGROUND=#88307b
  typeset -g POWERLEVEL9K_MISE_MAVEN_SHOW_ON_UPGLOB='pom.xml|mvnw|mvnw.cmd'

  # Gradle
  typeset -g POWERLEVEL9K_MISE_GRADLE_ICON=''
  typeset -g POWERLEVEL9K_MISE_GRADLE_BACKGROUND=150
  typeset -g POWERLEVEL9K_MISE_GRADLE_FOREGROUND=#212121
  typeset -g POWERLEVEL9K_MISE_GRADLE_SHOW_ON_UPGLOB='*.gradle'

  # Substitute the default asdf prompt element
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/mise}")
}
