#Specific for Arch Linux
#source /home/sergio/.local/share/zsh/zsh-syntax-highlighting-filetypes.zsh
#export PACMAN=/usr/bin/powerpill
export NO_AT_BRIDGE=1
export STARDICT_DATA_DIR="/home/sergio/.local/share/sdcv/"
export PATH="${PATH}:/home/sergio/.local/bin:/home/sergio/.gem/ruby/2.2.0/bin"
export SYSTEMD_LESS=FRXMK
#export TERMCMD=urxvtc
export SUDO_EDITOR=/usr/bin/nvim 
export EDITOR=/usr/bin/nvim 
export EVENT_NOEPOLL=1
export AURDEST=/home/sergio/Builds/Container/home/packager/PKGBUILDS/
#================================================================================
#NO EDITAR DESPUÉS DE ESTA LÍNEA
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'Introduce %d'
zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' condition 0
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'Found %e errors'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/sergio/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2048
SAVEHIST=2048
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
#NO EDITAR ANTES DE ESTA LÍNEA
#================================================================================

#Colores

n_black=0
n_red=1
n_green=2
n_yellow=3
n_blue=4
n_magenta=5
n_cyan=6
n_white=7
b_black=8
b_red=9
b_green=10
b_yellow=11
b_blue=12
b_magenta=13
b_cyan=14
b_white=15
#b_black=0
#b_red=1
#b_green=2
#b_yellow=3
#b_blue=4
#b_magenta=5
#b_cyan=6
#b_white=7
#n_black=8
#n_red=9
#n_green=10
#n_yellow=11
#n_blue=12
#n_magenta=13
#n_cyan=14
#n_white=15

#Configuración propia:
setopt nohashdirs
setopt completealiases
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
#alias pacman -Syu='pacmatic -Syu'
alias ls='ls -F --color=auto --group-directories-first'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto '
#alias sbcl='rlwrap -c -D 2 sbcl'
alias sbcl="rlwrap -pred -r -s 65536 -m -i -c -D 2 sbcl"
alias rm='rm -I'
alias vi='nvim'
alias enable_vbox='sudo modprobe vboxdrv vboxnetadp vboxnetflt vboxpci'
alias disable_vbox='sudo modprobe -r vboxdrv vboxnetadp vboxnetflt vboxpci'
alias speed_test='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias :q='exit'
alias :Q='exit'
alias reflector_script='sudo /etc/pacman.d/Reflector_script.sh'
alias sudo='sudo '
#alias mpd_start='systemctl start mpd.service mpdscribble.service --user'
#alias mpd_stop='systemctl stop mpd.service mpdscribble.service --user'
alias start_mpd='systemctl start mpd.service --user'
alias stop_mpd='systemctl stop mpd.service --user'
alias start_mpdas='systemctl start mpdas.service --user'
alias stop_mpdas='systemctl stop mpdas.service --user'
alias wifi_on='nmcli radio wifi on'
alias wifi_off='nmcli radio wifi off'
alias container_run='sudo systemd-nspawn -u packager -D ~/Builds/Container'

function cdr {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
#[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
#[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Up]}"   ]]  && bindkey  "${key[Up]}"    history-beginning-search-backward
[[ -n "${key[Down]}" ]]  && bindkey  "${key[Down]}"  history-beginning-search-forward

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish 

fi
#if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    #function zle-line-init () {
        #printf '%s' "${terminfo[smkx]}"
    #}
    #function zle-line-finish () {
        #printf '%s' "${terminfo[rmkx]}"
    #}
    #zle -N zle-line-init
    #zle -N zle-line-finish
#fi

setopt prompt_subst
autoload -U colors && colors

#┌┐└┘─│┴┬┤├┼╼╽╾╿
function calcula_ancho {

    temp="${USER}@${HOST} []"
    dir_actual=$PWD

    if [[ "$dir_actual[0,${#HOME}]" == "$HOME" ]]
    then
        dir_actual="~$dir_actual[$((${#HOME}+1)),-1]"
    fi

    let restante=${COLUMNS}-${#temp}
    longitud_dir=${#dir_actual}
    if [[ "$longitud_dir" -gt "$restante" ]]
    then
        dir_actual="...${dir_actual:$(($longitud_dir-$restante+3))}"
    fi
}

function nivel_ranger {
if [ -z "$RANGER_LEVEL" ]
then
    string_nivel=""
else
    string_nivel=" ranger │"
fi

}

reload () {
    exec "${SHELL}" "$@"
}

case $TERM in
    termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
        precmd () {
            print -Pn "\e]0;%m: %1~\a"
            calcula_ancho
            #tmux_sessions
        } 
        preexec () { 
            print -Pn "\e]0;%m: [$1]\a" 
            #print -rn -- $terminfo[el];
        }
        ;;
    screen|screen-256color)
        precmd () { 
            #print -Pn "\e]83;title \"$1\"\a" 
            print -Pn "\e]0;tmux - %m: %1~\a"
            calcula_ancho
            #tmux_sessions
        }
        preexec () { 
            #print -Pn "\e]83;title \"$1\"\a" 
            print -Pn "\e]0;tmux - %m: [$1]\a" 
            #print -rn -- $terminfo[el];
        }
        ;; 
    *)
        precmd () {
            calcula_ancho
            #tmux_sessions
        } 
        ;;
esac

over_ssh() {
    if [ -n "${SSH_CLIENT}" ]; then
        return 0
    else
        return 1
    fi
}

if over_ssh; then
    #prompt_is_ssh="%{%K{$n_yellow}%B%F{$n_white}%} SSH %{%b%K{$n_magenta}%F{$n_yellow}%}"
    prompt_is_ssh="%{%B%F{$n_yellow}%}[SSH]"
else
    prompt_is_ssh=""
fi

tmux_sessions(){
    if $(tmux info &> /dev/null) 
    then 
        #numero_tmux="%{%K{$n_magenta}%B%F{$n_white}%} tmux $separador2 $(tmux ls | wc -l) %{%b%K{$n_cyan}%F{$n_magenta}%}"
        numero_tmux="%{%F{$n_magenta}%B%}[tmux: $(tmux ls | wc -l)]"
    else
        numero_tmux=""
    fi
}

if [ -n "${RANGER_LEVEL}" ]
then
    nivel_ranger="%{%F{$n_cyan}%B%}[ranger]"
else
    nivel_ranger=""
fi

        
#    ▀ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▌ ▍ ▎ ▏ ▐ ░ ▒ ▓ ▔ ▕ ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟ │
#┌┐└┘─│┴┬┤├┼╼╽╾╿

#PROMPT='%{%B%K{$n_blue}%F{$n_white}%} %n %{%b%K{$n_green}%F{$n_blue}%}$separador1%{%B%F{$n_white}%} %m %{%b%K{$n_red}%F{$n_green}%}$separador1%{%B%F{$n_white}%} $dir_actual %{%b%k%F{$n_red}%}$separador1
#$prompt_is_ssh$separador1$numero_tmux$separador1$nivel_ranger$separador1%{%K{$n_red}%B%F{$n_white}%} %#%(0?,, %{%b%K{$n_red}%F{$n_white}%}$separador2 %{%B%F{$n_white}%}%?) %{%b%k%F{$n_red}%}$separador1%{%b%k$reset_color%} '

#RPROMPT='%{%F{$n_red}%}$separador3%{%B%K{$n_red}%F{$n_white}%} %* %{%b%F{$n_red}%}$separador1%{$reset_color%}'
#│┌┐└┘─
#PROMPT='%{%B%F{$n_blue}%}┌─%{%B%F{$n_red}%}[%{%B%F{$n_blue}%}%n%{%B%F{$n_yellow}%}@%{%B%F{$n_green}%}%m%{%B%F{$n_red}%}]%{%B%F{$n_blue}%}─%{%B%F{$n_red}%}[$dir_actual]
#%{%B%F{$n_blue}%}└─$prompt_is_ssh$nivel_ranger%{%B%F{$n_red}%}[%(0?,%{%B%F{$n_green}%},%{%B%F{$n_red}%})%#%{%B%F{$n_red}%}] %{$reset_color%}'
PROMPT='%{%B%F{$n_blue}%}%n%{%B%F{$n_yellow}%}@%{%B%F{$n_green}%}%m%{%B%F{$n_red}%} [$dir_actual]
$prompt_is_ssh$nivel_ranger%(0?,%{%B%F{$n_green}%},%{%B%F{$n_red}%})%# %{$reset_color%}'
#RPROMPT='$prompt_is_ssh$nivel_ranger %{$reset_color%}'

#terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
#PS1_2="$(acpi -t)"
#PS1="%{$terminfo_down_sc$PS1_2$terminfo[rc]%} %# %{$reset_color%}"
#preexec () { print -rn -- $terminfo[el]; }

autoload -U   edit-command-line
zle -N        edit-command-line
bindkey -M vicmd 'v' edit-command-line

setopt interactivecomments
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
