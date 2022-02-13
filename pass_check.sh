#!/bin/bash

declare -a PASSWORD
PASSWORD+=('test')

for num in $( seq 0 $(( ${#PASSWORD[@]} - 1)) )
do
  p=${PASSWORD[$num]}
  echo "[$((num + 1))] $p"
  echo $p | pwscore admin
done
