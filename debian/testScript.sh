#!/bin/bash

cd ./obj*

output=$(ctest -V -N)
i=0
n=0

printf %s "$output" | while IFS= read -r line
do
   for word in $line
    do 
      if [[ $word == *.shell* ]] 
	then
	  $(xvfb-run $word --quiet)
	  sleep 5
	  n=$((n + 1))
	  echo "Running Test $line"
	  if [[ $? == 0 ]]
	    then
	      echo "Passed Test!"
	      i=$((i + 1))
	    else
	      echo "Test failed"
	      exit $?
	  fi
      fi
   done
done