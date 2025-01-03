#!/bin/bash
# author: Ganesh Reddy
# Date: 02-01-2025

echo "All veriables: $@"
echo "Number of variables: $#"
echo "script name: $0"
echo "Present user: $UID"
echo "present directory: $PWD"
echo "home directory: $HOME"
echo "Process id of present script: $$"
sleep 60 & 
echo "Process id last command background: $!"
echo "Random number: $RANDOM"
sleep 5 
echo "Elapsed time: $SECONDS seconds