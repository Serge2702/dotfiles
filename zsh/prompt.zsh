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

#┌┐└┘─│┴┬┤├┼╼╽╾╿

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

if over_ssh; then
    #prompt_is_ssh="%{%K{$n_yellow}%B%F{$n_white}%} SSH %{%b%K{$n_magenta}%F{$n_yellow}%}"
    prompt_is_ssh="%{%B%F{$n_yellow}%}[SSH]"
else
    prompt_is_ssh=""
fi

if [ -n "${RANGER_LEVEL}" ]
then
    nivel_ranger="%{%F{$n_cyan}%B%}[ranger]"
else
    nivel_ranger=""
fi

        
#    ▀ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▌ ▍ ▎ ▏ ▐ ░ ▒ ▓ ▔ ▕ ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟ │
#┌┐└┘─│┴┬┤├┼╼╽╾╿

PROMPT='%{%B%F{$n_blue}%}%n%{%B%F{$n_yellow}%}@%{%B%F{$n_green}%}%m%{%B%F{$n_red}%} [$dir_actual]
$prompt_is_ssh$nivel_ranger%(0?,%{%B%F{$n_green}%},%{%B%F{$n_red}%})%# %{$reset_color%}'

