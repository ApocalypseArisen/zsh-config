# ------------------------------------------------
# Modernized af-magic theme
# 
# Original theme by: Andy Fleming
# URL: http://andyfleming.com/
# ------------------------------------------------

# Git prompt configuration
ZSH_THEME_GIT_PROMPT_PREFIX=" %F{75}(%F{78}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{214}*"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{75})%f"

# Venv prompt configuration
ZSH_THEME_VIRTUALENV_PREFIX=" %F{75}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%f"

# Calculate and draw appropriate number of dashes to fill the terminal width,
afmagic_separator() {
  local time=${(%):-%D{%H:%M:%S}}
  local python_env="${python_env_dir##*/}"
  local prefix="- $time "
  local dash_count=$(( COLUMNS - ${#prefix} ))
  
  # Make sure venv is accounted for in the dash count
  if [[ -n "$python_env" && "$PS1" = *\(${python_env}\)* ]]; then
    dash_count=$(( dash_count - ${#python_env} - 3 ))
  elif [[ -n "$VIRTUAL_ENV_PROMPT" && "$PS1" = *${VIRTUAL_ENV_PROMPT}* ]]; then
    dash_count=$(( dash_count - ${#VIRTUAL_ENV_PROMPT} - 3 ))
  fi

  local dash_count=$(( COLUMNS - ${#prefix} ))
  local dashes=${(l:$dash_count::-:)}
  
  print -r -- "$prefix$dashes"
}

# Prompt
PS1='$(print -P "%F{237}$(afmagic_separator)%f")
%F{32}%~$(git_prompt_info) %F{105}%(!.#.»)%f '
PS2='%F{red}\ %f'

# Right prompt: return code, virtualenv and context (user@host)
RPROMPT='%(?..%F{red}%? ↵%f)'

if (( $+functions[virtualenv_prompt_info] )); then
  RPROMPT+='$(virtualenv_prompt_info)'
fi

RPROMPT+=' %F{237}%n@%m%f'
