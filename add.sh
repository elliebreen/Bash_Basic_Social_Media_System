#!/bin/bash
friendwall="$1"/friends

if [ $# -ne 2 ]; then
     echo "Error: Parameter Problem" >&2
     exit 1
elif ! [ -d "$1"  ]; then
     echo "Error: User Does not exist" >&2
     exit 1
elif ! [ -d "$2" ]; then
     echo "Error: Friend does not exist" >&2
     exit 1

elif  grep -e "$2" "$1"/friends;  then
    echo "Error: User already friends with this user" >&2
    exit 1
else

./P.sh "$friendwall"
    echo "$2" >> "$1"/friends 
    echo "OK: Friend Added"
 ./V.sh "$friendwall"   
    exit 0

fi 

