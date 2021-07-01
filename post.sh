#!/bin/bash
filepath="$1"/wall
if [ ! $# -eq 3 ]; then
   echo "Error: Parameter Problem" >&2
   exit 1
elif ! [ -d "$1" ]; then
   echo "Receiver does not exist" >&2
   exit 1
elif ! [ -d "$2" ]; then
   echo "Sender does not exist" >&2
   exit 1
elif ! grep -q -e "$2" "$1"/friends; then 
  echo "Error: Sender is not a friend of receiver" >&2
   exit 1
else
  
    ./P.sh "$filepath"
      echo "$2"":" "$3" >> "$1"/wall
      echo "Ok: Message posted to wall"
     ./V.sh "$filepath"
  exit 0
 
fi
