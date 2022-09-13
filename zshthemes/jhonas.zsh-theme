#blue
theme:userhost(){
    echo "%{$fg[blue]%}%n@%m%{$reset_color%}"
}
#cyan
theme:curr_directory(){
    echo "%{$fg[cyan]%}%0~%{$reset_color%}"
}

theme:time(){
    echo "%{$fg[black]%}%*%{$reset_color%}"
}

theme:git_prompt_info(){
    local ahead
    local behind
    local prompt


    prompt="%{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    ahead="$(git_commits_ahead)"
    behind="$(git_commits_behind)"

    if [[ -n "$ahead" ]] || [[ -n "$behind" ]]; then
        prompt+=": "
        if [[ -n "$ahead" ]] && [[ -n "$behind" ]]; then 
            prompt+="$ahead, $behind"
        elif [[ -n "$ahead" ]]; then prompt+="$ahead"
        else prompt+="$behind"
        fi
    fi
    echo $prompt
}

theme:prompt_symbol(){
    echo "%{$fg[yellow]%}\Uf155%{$reset_color%}"
}

theme:cmndexit_status(){
    echo "%(?.%{$fg[green]%}\Uf00c.%{$fg[red]%}\Uf00d)"
}
theme:root_symb(){
    echo "%(!.\Ufc7e.)"
}


PROMPT='$(theme:userhost) $(theme:curr_directory) $(theme:git_prompt_info)
$(theme:prompt_symbol)%{$reset_color%} '
RPROMPT='$(theme:root_symb) $(theme:cmndexit_status) $(theme:time)'
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="+"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="-"