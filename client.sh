#!/bin/bash


clientID="$1"
req="$2"
trap "rm -f $clientID.pipe" EXIT

if [ ! -p "$clientID.pipe" ]; then
mkfifo "$clientID.pipe"      
fi

if [ $# -lt 2 ]; then
   echo "Error: Parameters problem" >&2
   exit 1


elif [ "$req" == "create" ]; then
   user="$3"
   if [[ -z "$clientID" || -z "$user"  ]]; then
       echo "Error: ClientID and/or User not given"    
       exit 1   
   else
       echo "$@" >> server.pipe        
  fi

elif [ "$req" == "add" ]; then
  user="$3"
  friend="$4"
  if [[ -z "$clientID" || -z "$user" || -z "$friend" ]]; then
      echo "Error clientID/username/friend missing" 
      exit 1  
  else
      echo "$@" >> server.pipe  
   fi

elif [ "$req" == "post" ]; then
   receiver="$3"
   sender="$4"
   message="$5"
   if [[ -z "$clientID" || -z "$receiver" || -z "$sender" || -z "$message" ]]; then
       echo "Error: ClientID/recevier/sender/message not given"
       exit 1 
   else
       echo "$@" >> server.pipe
  
   fi

elif [ "$req" == "show"  ]; then
   user="$3"
   if [[ -z "$clientID" || -z "$user" ]]; then
      echo "Error: ClientID/username not given"   
      exit 1
   else
      echo "$@" >> server.pipe   
    
    fi

elif [ "$req" == "shutdown" ]; then
     echo "$clientID $req" >> server.pipe
     
else
     echo "Error: Invalid request"
     exit 1
fi

cat < "$clientID.pipe"

