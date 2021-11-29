# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME'/.local/google-cloud-sdk/path.zsh.inc' ]; then . $HOME'/.local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME'/.local/google-cloud-sdk/completion.zsh.inc' ]; then . $HOME'/.local/google-cloud-sdk/completion.zsh.inc'; fi

export HOMEBREW_PREFIX="/home/ib/.linuxbrew";
export HOMEBREW_CELLAR="/home/ib/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/ib/.linuxbrew/Homebrew";
export HOMEBREW_SHELLENV_PREFIX="/home/ib/.linuxbrew";

export ZDOTDIR="$HOME/.config/zsh"

export PATH=$HOME/.local/bin:$HOME/Code/ccc-master/bin:$PATH:/home/ib/.linuxbrew/bin:/home/ib/.linuxbrew/sbin
export MANPATH=$PATH:/home/ib/.linuxbrew/share/man
export INFOPATH=$INFOPATH:/home/ib/.linuxbrew/share/info

export EDITOR=nvim
export BAT_THEME="Visual Studio Dark+"
