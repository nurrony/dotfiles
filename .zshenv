# Set XDG_CONFIG_HOME to default if it isn't already set
if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

# Set ZDOTDIR if the custom configuration folder exists
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# ---------- GPG ----------
export GPG_TTY=$(tty)
