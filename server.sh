#!/bin/bash

trap "rm -f server.pipe" EXIT

if [ ! -p server.pipe ]; then
   mkfifo server.pipe
fi


while true; do
  read -a request < server.pipe
 
  c="${request[0]}"
  clientpipe="$c.pipe"  
  message="${request[@]:4}" 
  case "${request[1]}" in
  create)
 
      ./create.sh  "${request[@]:2}" &> "$clientpipe"
   ;;
  add)
      ./add.sh  "${request[@]:2}"  &> "$clientpipe"
     ;;
  post)
     ./post.sh "${request[2]}" "${request[3]}" "$message" &> "$clientpipe"
     ;;
  show)
     ./show.sh "${request[@]:2}" &> "$clientpipe"
     ;;
  shutdown)  
     echo "Shutting Down" &> "$clientpipe"
     exit 0 
     ;;
  *)
     echo "Error: bad request"  &> "$clientpipe"
     exit 1
  esac
done
