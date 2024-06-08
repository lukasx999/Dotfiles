#!/usr/bin/env bash

# current active command
command=$(ps -f --no-headers --ppid $(tmux display-message -p '#{pane_pid}') | awk '{ print substr($0, index($0,$8)) }')



file_name=`echo $command | awk '{print $2}'`



###
# quickfix for quickfind
file_name=$(echo $file_name | rev | cut -d'/' -f1 | rev)
###



pane_dir=$(tmux display-message -p -F "#{pane_current_path}")
# pane_dir=$(tmux list-panes -s -F "#{pane_current_path}/")


path=${pane_dir}"/"${file_name}


# check if path is an actual file
if ! [[ -f $path ]]; then
    echo "path is not right! $file_name"
    return 1
fi


file_type=$(file $path | awk '{print $2}')


base_path=$(echo $path | rev | cut -d'/' -f2- | rev)
bin_name="${base_path}/bin_$(basename $path | rev | cut -d'.' -f2- | rev)"
extension="$(basename $path | rev | cut -d'.' -f1 | rev)"



if [[ -x $path ]]; then
    run_cmd=$path

# elif [[ $file_type == "Python" ]]; then
#     run_cmd="python $path"

elif [[ $extension == "py" ]]; then
    run_cmd="python $path"

elif [[ $extension == "cpp" ]]; then
    g++ $path -o $bin_name
    run_cmd="$bin_name"

elif [[ $extension == "c" ]]; then
    gcc $path -o $bin_name
    run_cmd="$bin_name"

else
    tmux display-message "code run failed: unsupported filetype!"
    return 0

fi


#tmux display-message "$run_cmd ........... $path"


# set default shell temporaorily to bash
default_shell=$(tmux show-options -g | grep "default-shell" | awk '{print $2}')
tmux set -g default-shell /usr/bin/bash




mode=$1

NC='\033[0m' # No Color
Blue='\033[0;34m'
Black='\033[0;30m'
Grey='\033[0;90m'
Red='\033[0;31m'
Green='\033[0;32m'


empty_str="${Grey}--------------${NC}"

if [[ $mode == "window" ]]; then
    tmux new-window -c $base_path "echo -e 'running: $path\n$empty_str\n' && $run_cmd && echo -e '\n$empty_str\nsuccess!' || echo -e '\n$empty_str\nfailure!' ; read -n 1 -s -r"

elif [[ $mode == "split" ]]; then
    tmux split-window -c $base_path -v "echo -e 'running: $path\n$empty_str\n' && $run_cmd && echo -e '\n$empty_str\nsuccess!' || echo -e '\n$empty_str\nfailure!' ; read -n 1 -s -r"

elif [[ $mode == "vsplit" ]]; then # most used
    tmux split-window -c $base_path -h "echo -e '${Blue}running: $path\n$empty_str\n' && $run_cmd && echo -e '\n$empty_str\n${Green}success!' || echo -e '\n$empty_str\n${Red}failure!' ; read -n 1 -s -r"

fi




# important bak
#tmux split-window -c $base_path -h "echo -e 'running: $path\n$empty_str\n' && $run_cmd && echo -e '\n$empty_str\nsuccess!' || echo -e '\n$empty_str\nfailure!' ; read -n 1 -s -r"



# bak
#tmux split-window -v "echo -e 'running: $path\n$empty_str\n' && $run_cmd && echo -e '\n$empty_str\nsuccess!' || echo -e '\n$empty_str\nfailure!' ; read -n 1 -s -r"


tmux set -g default-shell $default_shell




