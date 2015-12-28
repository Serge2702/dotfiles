function cdr {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}


reload () {
    exec "${SHELL}" "$@"
}

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

over_ssh() {
    if [ -n "${SSH_CLIENT}" ]; then
        return 0
    else
        return 1
    fi
}

tmux_sessions(){
    if $(tmux info &> /dev/null) 
    then 
        #numero_tmux="%{%K{$n_magenta}%B%F{$n_white}%} tmux $separador2 $(tmux ls | wc -l) %{%b%K{$n_cyan}%F{$n_magenta}%}"
        numero_tmux="%{%F{$n_magenta}%B%}[tmux: $(tmux ls | wc -l)]"
    else
        numero_tmux=""
    fi
}
