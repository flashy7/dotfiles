autoload -U colors && colors
setopt promptsubst

#source $HOME/.config/zsh/plugins/git.zsh
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
#RPROMPT='$(git_prompt_info)'

# History cache
HISTSIZE=3000
SAVEHIST=3000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#source $HOME/.config/zsh/plugins/command-not-found.plugin.zsh # Works on Ubuntu
#source /usr/share/doc/pkgfile/command-not-found.zsh # Works on Arch. Needs package: pkgfile

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

alias ls='ls --color=auto'

# Butthead direct login
alias butthead='ssh -t bajelidze@login.comsys.rwth-aachen.de ssh -t bajelidze@butthead.comsys.rwth-aachen.de'
alias dcrm='docker rm $(docker ps -qa) -fv'
alias dp='docker ps -a'
alias dcrmi='docker images | grep none | awk "{ print $3; }" | xargs docker rmi'

alias cdd='cd ~/Downloads'
alias cdD='cd ~/Desktop'

# Devour aliases
alias mpv='devour mpv'
alias zathura='devour zathura'
alias sxiv='devour sxiv'
alias evince='devour evince'
alias wireshark='devour wireshark'

alias streamlink='streamlink --twitch-low-latency --hls-live-edge=1 --player=mpv'
alias lf='~/.config/lf/lfrun'
