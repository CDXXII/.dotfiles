# You may need to manually set your language environment
export LANG=en_US.UTF-8

# XDG base directory
[[ -n "$XDG_CONFIG_HOME"   ]] || export XDG_CONFIG_HOME=$HOME/.config
[[ -n "$XDG_CACHE_HOME"    ]] || export XDG_CACHE_HOME=$HOME/.cache
[[ -n "$XDG_DATA_HOME"     ]] || export XDG_DATA_HOME=$HOME/.local/share

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Editor
export EDITOR=nvim

# Highlight
export CLICOLOR=1

# LF
export LFCD="$HOME/.config/lf/lfcd.sh"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
