alias xclip="xclip -selection c"
export TERM=screen-256color

function nocolor {
    alias ls="ls --color=never"
}

function color {
    unalias ls
}

INNER_COLOR="\[\033[0;36m\]"
OUTER_COLOR="\[\033[0;35m\]"
NO_COLOR="\[\033[0m\]"
PS1="$OUTER_COLOR[$INNER_COLOR\u@\h:\w$OUTER_COLOR]>$NO_COLOR "

