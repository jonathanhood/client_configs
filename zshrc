##
## Setup oh-my-zsh
##
export ZSH="/Users/jhood/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

##
## Setup my prompt
##
export PROMPT='%F{magenta}[%F{cyan}%n@%m:%~%F{magenta}]> %F{white}'

##
## Setup terminal colors so that vim will
## be happy and colorful.
##
export TERM=xterm-256color

##
## Stop making vim lock up if I happen to hit ctrl+s
## by accident
##
stty -ixon
