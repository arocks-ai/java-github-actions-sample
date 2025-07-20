#!/bin/bash
# Usage: ./set-variable.sh <env> "<input list>"

env=$1
input_list=$2

# Normalize input list by removing spaces around commas
cleaned=$(echo "$input_list" | sed 's/ *, */,/g')

# Get position of the current environment
index=$(echo "$cleaned" | tr ',' '\n' | awk "/^${env}$/ {print NR}")

# Set 'firstrun' output based on position
if [[ $index -eq 1 ]]; then
  echo "firstrun=false" >> $GITHUB_OUTPUT
else
  echo "firstrun=true" >> $GITHUB_OUTPUT
fi
