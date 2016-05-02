
##
## Setup xclip to copy to the same copy/paste
## board used by the x-window system
##
alias xclip="xclip -selection c"

##
## Setup terminal colors so that vim will
## be happy and colorful.
##
export TERM=xterm-256color

##
## Platform Detection Helpers
##
function mac {
    [ `uname` == "Darwin" ]
}

function linux {
    [ `uname` != "Darwin" ]
}

## 
## Setup macros to hide colors so that I can disable
## them when SSH'd into the box via putty
##
if linux;
then
    function nocolor {
        alias ls="ls --color=never"
    }

    function color {
        alias ls="ls --color=auto"
    }

    color
fi

##
## Small commands to setup a static web server in
## the current folder and stop it later
##
alias serve="python -m SimpleHTTPServer > /dev/null 2>&1 &"

if mac;
then
    alias stopserve="ps -ax | grep SimpleHTTPServer | head -n 1 | awk '{print \$1}' | xargs kill" 
else
    alias stopserve="ps -ux | grep SimpleHTTPServer | awk '{print \$2}' | xargs kill"
fi

##
## Use OpenConnect on Linux to connect with the ADTRAN
## VPN without any i386 firefox headache
##
if linux
then
	alias vpn="sudo openconnect --juniper vpn.adtran.com"
fi

##
## Setup the terminal prompt
##
INNER_COLOR="\[\033[0;36m\]"
OUTER_COLOR="\[\033[0;35m\]"
NO_COLOR="\[\033[0m\]"
PS1="$OUTER_COLOR[$INNER_COLOR\u@\h:\w$OUTER_COLOR]>$NO_COLOR "

