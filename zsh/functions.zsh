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

function in_git_dir()
{
    if  [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1
    then
        estado_de_git
    else
        git_status=""
    fi
}

function estado_de_git()
{
#    estado=$(git status --porcelain)
    #untracked=$(echo $estado | grep '^??' | wc -l)
    #uncommited=$(echo $estado | grep '^[MARCD]' | wc -l)
    #not_added=$(echo $estado | grep '^.[MARCD]' | wc -l)
    #git_status="%{%F{$n_blue}%B%}[Branch: %{%F{$n_white}%B%}$(git branch --no-color | cut -d' ' -f2) %{%F{$n_blue}%B%}Not Added: %{%F{$n_white}%B%}$not_added %{%F{$n_blue}%B%}Not Commited: %{%F{$n_white}%B%}$uncommited%{%F{$n_blue}%B%}%{%F{$n_blue}%B%} Not Tracked: %{%F{$n_white}%B%}$untracked%{%F{$n_blue}%B%}]%{$reset_color%}"
    git_status="%{%F{$n_blue}%B%}[Branch: %{%F{$n_white}%B%}$(git branch --no-color | grep '*'| cut -d' ' -f2)%{%F{$n_blue}%B%}]%{$reset_color%}"
}
