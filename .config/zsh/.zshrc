autoload -U colors && colors
setopt promptsubst
alias ls='ls --color=auto'

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

PROMPT='%B%{$fg[green]%}%n%{$fg[green]%}@%{$fg[green]%}%M:%{$fg_bold[blue]%}%~%{$reset_color%}$ '
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
source $HOME/.config/zsh/plugins/command-not-found.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Edit line in vim with ctrl-r:
autoload edit-command-line; zle -N edit-command-line
bindkey '^x' edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Disable directory underlining
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Butthead direct login
alias butthead='ssh -t bajelidze@login.comsys.rwth-aachen.de ssh -t bajelidze@butthead.comsys.rwth-aachen.de'
alias dcrm='docker rm $(docker ps -qa) -fv'
alias cdd='cd ~/Downloads'
alias cdD='cd ~/Desktop'
