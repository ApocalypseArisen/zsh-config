ZSH_WORKSPACE="$HOME/.zsh/zsh-config"

# Autocompletion system
autoload -U compinit; compinit

# Arrow keys for autocompletion
zstyle ':completion:*' menu select

# Colors
autoload -U colors && colors
source $ZSH_WORKSPACE/themes/colors.zsh

# History config
HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt extended_history
setopt HIST_FIND_NO_DUPS

# User functions
source $ZSH_WORKSPACE/helpers/user.zsh

# Plugins
source $ZSH_WORKSPACE/helpers/git_plugin.zsh
source $ZSH_WORKSPACE/helpers/venv_plugin.zsh
source $ZSH_WORKSPACE/helpers/extract_plugin.zsh

# Theme
source $ZSH_WORKSPACE/themes/af-magic.zsh

# Use zoxide instead of cd if available
if (( $+commands[zoxide] )); then
    source $ZSH_WORKSPACE/helpers/zoxide_plugin.zsh
    alias cd='z'
fi

# Enable expansion of variables in the prompts (Neccesary for the theme to work)
setopt prompt_subst
