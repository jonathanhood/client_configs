
##
## Setup xclip to copy to the same copy/paste
## board used by the x-window system
##
alias xclip="xclip -selection c"

##
## Deal with terrible overscanned TVs
##
alias fix-overscan="sudo intel_panel_fitter -p A -x 1820 -y 1020"

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
    [[ `uname` != "Darwin" && `uname` != *"MINGW"* ]]
}

function xenial {
    [[ -x "$(command -v lsb_release)" && `lsb_release -sr` == "16.04" ]]
}

function bionic {
    [[ -x "$(command -v lsb_release)" && `lsb_release -sr` == "18.04" ]]
}

function mint18 {
	[[ -x "$(command -v lsb_release)" && `lsb_release -sr` == "18" ]]
}

function mint18_1 {
	[[ -x "$(command -v lsb_release)" && `lsb_release -sr` == "18.1" ]]
}

function mint19 {
	[[ -x "$(command -v lsb_release)" && `lsb_release -sr` == "19" ]]
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
if linux && (xenial || mint18 || mint18_1 || bionic || mint19);
then
	alias vpn="sudo openconnect --juniper vpn.adtran.com"
fi

##
## Make setting up a kaylee environment easier
##
function kaylee-environ {
    eval " $(kaylee dev environ)"
}

##
## Setup the terminal prompt
##
INNER_COLOR="\[\033[0;96m\]"
OUTER_COLOR="\[\033[0;95m\]"
NO_COLOR="\[\033[0m\]"
PS1="$OUTER_COLOR[$INNER_COLOR\u@\h:\w$OUTER_COLOR]>$NO_COLOR "

