# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
[ -r /home/ib/.byobu/prompt ] && . /home/ib/.byobu/prompt   #byobu-prompt#

export ZDOTDIR="$HOME/.config/zsh"

# export PATH=$HOME/.local/bin:$HOME/Code/ccc-master/bin:$HOME/go/bin/:$PATH:/home/ib/.linuxbrew/bin:/home/ib/.linuxbrew/sbin
export PATH=$HOME/.local/bin:$HOME/Code/ccc/bin:$HOME/go/bin/:$PATH:/home/ib/.linuxbrew/bin:/home/ib/.linuxbrew/sbin
export MANPATH=$PATH:/home/ib/.linuxbrew/share/man
export INFOPATH=$INFOPATH:/home/ib/.linuxbrew/share/info

# export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/.linuxbrew/include
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.linuxbrew/lib

export EDITOR=nvim
export BAT_THEME="Visual Studio Dark+"

export HOMEBREW_PREFIX="/home/ib/.linuxbrew";
export HOMEBREW_CELLAR="/home/ib/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/ib/.linuxbrew/Homebrew";
export HOMEBREW_SHELLENV_PREFIX="/home/ib/.linuxbrew";

# Aliases
alias ls='ls --color=auto --group-directories-first -h'
alias cp='cp -iv'
alias ln='ln -iv'
alias mv='mv -iv'
alias rm='rm -I --preserve-root'
alias rmdir='rmdir -v'
alias grep='grep --color=auto'
alias mkdir='mkdir -vp'
alias v='nvim'
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias dcrm='docker rm $(docker ps -qa) -fv'
alias dp='docker ps -a'
alias dcrmi='docker images | grep none | awk "{ print $3; }" | xargs docker rmi'

alias cdd='cd ~/Downloads'
alias cdD='cd ~/Desktop'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ib/.local/google-cloud-sdk/path.bash.inc' ]; then . '/home/ib/.local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ib/.local/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ib/.local/google-cloud-sdk/completion.bash.inc'; fi
. "$HOME/.cargo/env"
