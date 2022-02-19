#!/bin/bash
init_git(){
if [[ -f $HOME/init_git.sh ]]; then
    bash init_git.sh
fi
}
init_git
sleep infinity & wait
