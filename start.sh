#!/bin/bash
init_script(){
if [[ -f $HOME/init_script.sh ]]; then
    bash init_script.sh
fi
}
init_script
sleep infinity & wait
