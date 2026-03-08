ZSH_WORKSPACE="$HOME/.zsh/zsh-config"

# Load keyboard bindings so that home/end/del work correctly
source $ZSH_WORKSPACE/helpers/keyboard.zsh

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

# Plugins
source $ZSH_WORKSPACE/plugins/cls_plugin.zsh
source $ZSH_WORKSPACE/plugins/git_plugin.zsh
source $ZSH_WORKSPACE/plugins/venv_plugin.zsh
source $ZSH_WORKSPACE/plugins/extract_plugin.zsh

# Use zoxide instead of cd if available
if (( $+commands[zoxide] )); then
    source $ZSH_WORKSPACE/plugins/zoxide_plugin.zsh
    alias cd='z'
fi

# Theme
source $ZSH_WORKSPACE/themes/af-magic.zsh

# Enable expansion of variables in the prompts (Neccesary for the theme to work)
setopt prompt_subst
