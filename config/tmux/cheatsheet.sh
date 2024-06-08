#!/usr/bin/env bash

languages=$(echo -e "awk arduino assembly matlab csharp java js haskell fortran fsharp elisp elixir erlang go cmake django flask git ruby r python3 php perl scala latex golang lua c cpp rust python bash nix" | tr ' ' '\n')
core_utils=$(echo -e "xargs find mv sed awk grep tr" | tr ' ' '\n')

selected=$(cat <(echo "$languages") <(echo "$core_utils") | fzf --reverse)
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query


mode=$1



# split mode
if [[ -z $mode ]]; then

if echo $languages | grep -qs "$selected"; then
    query=$(echo $query | tr ' ' '+')
    curl -s cht.sh/$selected/$query | bat --paging=always --style=plain
else
    curl -s cht.sh/$selected~$query | bat --paging=always --style=plain
fi

fi


# window mode
if [[ $mode == "window" ]]; then

if echo $languages | grep -qs "$selected"; then
    query=$(echo $query | tr ' ' '+')
    #tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done" # original

    #tmux new-window bash -c "curl -s cht.sh/$selected/$query | bat --paging=always --style=plain"
    #tmux rename-window "cht.sh "'('$selected": "$query')'

    tmux new-window -n "cht.sh ($selected: ${query/+/ })" "curl -s cht.sh/$selected/$query | bat --paging=always --style=plain"

else
    #tmux neww bash -c "curl -s cht.sh/$selected~$query | less" # original

    #tmux new-window bash -c "curl -s cht.sh/$selected~$query | bat --paging=always --style=plain"
    #tmux rename-window "cht.sh "'('$selected": "${query/+/ }')'

    tmux new-window -n "cht.sh ($selected: ${query/+/ })" "curl -s cht.sh/$selected~$query | bat --paging=always --style=plain"
fi

fi



