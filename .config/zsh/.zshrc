# terminal color settings
set termguicolors

# uncomment these lines if you are using powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
dotfiles=(extra exports path source aliases functions fzf containerfunctions kubefunctions cli-packages)
for f in "$HOME/.dotfiles/."${^dotfiles}(N); do
  source "$f"
done
unset dotfiles f

# Load zsh options
[[ -f "$HOME/.dotfiles/.config/zsh/.zsh_options" ]] && source "$HOME/.dotfiles/.config/zsh/.zsh_options"

# load zinit plugin manager. See https://github.com/zdharma-continuum/zinit.git
declare -A ZINIT
ZINIT_BASE="${DEV_ZONE_CONFIG_PATH:-${XDG_DATA_HOME:-$HOME/.local/share}}/zinit"
ZINIT[HOME_DIR]="$ZINIT_BASE"
ZINIT[BIN_DIR]="$ZINIT_BASE/zinit.git"
# Clone Zinit if missing (silent check)
if [[ ! -d "${ZINIT[BIN_DIR]}/.git" ]]; then
  mkdir -p "${ZINIT[HOME_DIR]}"
  git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "${ZINIT[BIN_DIR]}"
fi
source "${ZINIT[BIN_DIR]}/zinit.zsh"

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
P10K_VARIANT=${P10k_VARIANT:-pure}
zinit ice depth'1' atload"[[ ! -f $HOME/.dotfiles/.config/p10k/p10k.$P10K_VARIANT.zsh ]] || source $HOME/.dotfiles/.config/p10k/p10k.$P10K_VARIANT.zsh" nocd
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


# Load Plugins
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins.zsh


# COMPLETIONS FIRST (important)
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump" -C
zinit cdreplay -q
