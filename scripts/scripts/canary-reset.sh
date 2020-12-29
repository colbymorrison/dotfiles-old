#! /bin/bash

cd ~/configerator
canary_id=$(arc canary --list| grep -A 1 === | tail -n1 | cut -d ' ' -f 2)

echo "Cancelling canary $canary_id"

arc canary --cancel $canary_id

if [[ $1 == "-n" ]]; then
  echo "Starting new canary"
  arc canary
fi


