ZSH_WORKSPACE="$HOME/.zsh/zsh-config"

# Autocompletion system
autoload -U compinit; compinit

# Arrow keys for autocompletion
zstyle ':completion:*' menu select

# Colors
source $ZSH_WORKSPACE/themes/colors.zsh

# History config
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_FIND_NO_DUPS
setopt HIST_FIND_NO_DUPS

# User functions
source $ZSH_WORKSPACE/helpers/user.zsh

# Plugins
source $ZSH_WORKSPACE/helpers/git_plugin.zsh
source $ZSH_WORKSPACE/helpers/venv_plugin.zsh

# Theme
source $ZSH_WORKSPACE/themes/af-magic.zsh

# Enable expansion of variables in the prompts (Neccesary for the theme to work)
setopt prompt_subst
