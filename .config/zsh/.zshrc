autoload -U colors && colors
setopt promptsubst

source $HOME/.config/zsh/plugins/git.zsh
# source $HOME/.config/zsh/agnoster.zsh-theme
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Prompt theme
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}\uE0A0"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg_bold[blue]%}%~%{$reset_color%}$ '
RPROMPT='$(git_prompt_info)'

# History cache
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Disable directory underlining
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

