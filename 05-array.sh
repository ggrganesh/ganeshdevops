#!/bin/bash
# author: Ganesh Reddy
# Date: 02-01-2025

MOVIES=("Salaar" "Kalki" "RRR")

# Index starts from 0, to 3

echo "First movive name is: ${MOVIES[$0]}"
echo "Second movive name is: ${MOVIES[$1]}"
echo "Third movive name is: ${MOVIES[$2]}"

# Print all movies 

echo "All movies are:: ${MOVIES[@]}"

