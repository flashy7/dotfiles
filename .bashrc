# shellcheck disable=SC2148
# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

source "$HOME/.zshenv"
source "$HOME/.config/zsh/.zsh_aliases"
