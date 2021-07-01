#!/bin/bash





if [ $# -ne 1 ]; then
     echo "Error: parameters problem " >&2
     exit 1
 


  elif [ -d "$1"  ]; then
        echo "Error: user already exists" >&2
        exit 1

   else
         mkdir "$1"  
         touch "$1"/friends "$1"/wall
         echo "OK: user created"
          exit 0
     fi


