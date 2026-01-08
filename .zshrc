# terminal color settings
set termguicolors

# uncomment these lines if you are using powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/.{zsh_options,extra,exports,path,source,aliases,functions,fzf,containerfunctions,kubefunctions,cli-packages}; do
  [[ -r "$file" && -f "$file" && -O "$file" ]] && source "$file"
done;
unset file;

# load zinit plugin manager. See https://github.com/zdharma-continuum/zinit.git
declare -A ZINIT
ZINIT_BASE="${XDG_DATA_HOME:-${DEV_ZONE_CONFIG_PATH:-$HOME/.local/share}}/zinit"
ZINIT[HOME_DIR]="$ZINIT_BASE"
ZINIT[BIN_DIR]="$ZINIT_BASE/zinit.git"
# Create Zinit home dir if missing
[[ ! -d "${ZINIT[HOME_DIR]}" ]] && mkdir -p "${ZINIT[HOME_DIR]}"
[[ ! -d "${ZINIT[BIN_DIR]}/.git" ]] && git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT[BIN_DIR]}"
source "${ZINIT[BIN_DIR]}/zinit.zsh"

# load essential completion
zinit lucid light-mode for \
  as'completion' zsh-users/zsh-completions \
  zdharma/fast-syntax-highlighting \
  as'program' from'gh-r' atclone'./zoxide init --cmd=j zsh > init.zsh' src'init.zsh' atpull'%atclone' pick'zoxide/zoxide' ajeetdsouza/zoxide \
  as'program' from'gh-r' mv'mise* -> mise' atclone'./mise completion zsh > _mise && ./mise activate zsh > init.zsh' src'init.zsh' atpull'%atclone' jdx/mise

# install oh my zsh plugins as snippets
zinit wait'3' lucid light-mode for \
  OMZP::git \
  OMZP::mvn \
  OMZP::sudo \
  OMZP::ansible \
  OMZP::extract \
  OMZP::command-not-found \
  pick'alias-tips.plugin.zsh' djui/alias-tips \
  as'completion' pick'_curl' Valodim/zsh-curl-completion

zinit wait'10' lucid light-mode for \
  as'program' from'gh-r' jdx/usage \
  as'program' from'gh-r' medialab/xan \
  as'program' from'gh-r' danielmiessler/Fabric \
  as'program' from'gh-r' PaulJuliusMartinez/jless \
  as'program' from'gh-r' mv'witr-darwin-* -> witr' pranshuparmar/witr \
  as'program' from'gh-r' atpull'%atclone' atclone'./txeh completion zsh > _txeh' txn2/txeh


# COMPLETIONS FIRST (important)
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"

zinit cdreplay -q

#----------------------------------------------------------------
# THEMES
# - starship: https://starship.rs/
# - OhMyPosh: https://ohmyposh.dev/
# - powerlevel10k: https://github.com/romkatv/powerlevel10k
#.   - p10k.pure.zsh (for pure style theme variant)
#    - p10k.rainbow.zsh (for rainbow style theme variant)
#
# Note: Uncomment only the theme that you want to use.
#-----------------------------------------------------------------

# install powerline10k
zinit ice depth'1' atload"[[ ! -f $HOME/.dotfiles/.config/p10k/p10k.pure.zsh ]] || source $HOME/.dotfiles/.config/p10k/p10k.pure.zsh" nocd
zinit light romkatv/powerlevel10k

# install and load starship theme.
# zi ice as"command" from"gh-r" \
#   atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship;" \
#   atpull"%atclone" src"init.zsh"
# zi light starship/starship

# install and load ohmyposh theme
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   zi ice as"command" from"gh-r" mv'posh-* -> oh-my-posh' \
#     atclone"./oh-my-posh completion zsh > _oh_my_posh" \
#     atpull"%atclone" atload'eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/.config/ohmyposh/zen.toml)"'
#   zi light JanDeDobbeleer/oh-my-posh
# fi

# zinit wait'20' lucid light-mode for \
# as'program' from'gh-r' mv'kube-explorer* -> kube-explorer' cnrancher/kube-explorer
