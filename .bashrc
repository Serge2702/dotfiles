#
# ~/.bashrc
#

# If not running interactively, don't do anything
set -o vi
[[ $- != *i* ]] && return
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White
#Default PATH
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
#Path para ejecutar gemas de ruby
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/sergio/.gem/ruby/2.2.0/bin"


alias ls='ls --color=auto --group-directories-first'
alias cp='cp -i'
alias grep='grep --color=auto '
alias sbcl='rlwrap -c -D 2 sbcl'
alias rm='rm -I'
alias vi='vim'
alias enable_vbox='sudo modprobe vboxdrv vboxnetadp vboxnetflt vboxpci'
alias disable_vbox='sudo modprobe -r vboxdrv vboxnetadp vboxnetflt vboxpci'
alias speed_test='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias limpiar='trash-put *.fas *.lib'
alias cdr='ranger-cd'
alias :q='exit'
alias :Q='exit'
alias reflector_script='sudo /etc/pacman.d/Reflector_script.sh'
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
#shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=65535
export HISTFILESIZE=65535
export HISTIGNORE="exit:ls:history:free:sensors:speed_test:*q:*Q:fortune:cdr:ranger:reflector_script"
export HISTTIMEFORMAT="%h %d %H:%M:%S> "
#Script del prompt
hostnam=$HOSTNAME
usernam=$USER
#temp="$(tty)"
##   Chop off the first five chars of tty (ie /dev/):
#cur_tty="${temp:5}"
unset temp
#Ranger cd
function ranger-cd {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
bind '"\C-o":"ranger-cd\C-m"'
function prompt_command {

#   Find the width of the prompt:
TERMWIDTH=${COLUMNS}

#   Add all the accessories below ...
local temp="┌──[${usernam}::${hostnam}]───[${PWD}]──┘"

let fillsize=${TERMWIDTH}-${#temp}
if [ "$fillsize" -gt "0" ]
then
	fill="──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────"
	fill="${fill:0:${fillsize}}"
	newPWD="${PWD}"
fi

if [ "$fillsize" -lt "0" ]
then
	fill=""
	let cut=3-${fillsize}
	newPWD="...${PWD:${cut}}"
fi
}

PROMPT_COMMAND=prompt_command

function cool_prompt {

case $TERM in
    xterm*|rxvt*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

# PS1="$TITLEBAR\
# $YELLOW-$LIGHT_BLUE-(\
# $YELLOW\$usernam$LIGHT_BLUE@$YELLOW\$hostnam$LIGHT_BLUE:$WHITE\$cur_tty\
# ${LIGHT_BLUE})-${YELLOW}-\${fill}${LIGHT_BLUE}-(\
# $YELLOW\${newPWD}\
# $LIGHT_BLUE)-$YELLOW-\
# \n\
# $YELLOW-$LIGHT_BLUE-(\
# $YELLOW\$(date +%H%M)$LIGHT_BLUE:$YELLOW\$(date \"+%a,%d %b %y\")\
# $LIGHT_BLUE:$WHITE\$$LIGHT_BLUE)-\
# $YELLOW-\
# $NO_COLOUR " 
# 
# PS2="$LIGHT_BLUE-$YELLOW-$YELLOW-$NO_COLOUR "
PS1="\[$BBlue\]┌──\[$BRed\][\[$BGreen\]\$usernam\[$BYellow\]::\[$BBlue\]\$hostnam\[$BRed\]]\[$BBlue\]───\$fill\[$BRed\][\[$BYellow\]\${newPWD}\[$BRed\]]\[$BBlue\]──┘\[$Color_Off\]\n\[$BBlue\]└──\[$BRed\][\[$BWhite\]\#\[$BRed\]]\[$BBlue\]──╼ \[$Color_Off\]"
}
cool_prompt
#export PS1=chan_chan_chan!
