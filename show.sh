#!/bin/bash

display="$1"/wall
if [ $# -ne 1 ]; then

   echo "Error: parameters problem" >&2
   exit 1
elif ! [ -d "$1" ]; then
   echo "Error: user does not exist" >&2
   exit 1
else
  
      ./P.sh "$display"
       echo "wallStart" 
       cat "$1"/wall
       echo "wallEnd"  
       ./V.sh "$display"
    exit 0
 
fi


