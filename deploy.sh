#!/bin/bash
result=$( sudo docker images -q react-image )
docker run -itd --name My-first-container1 -p 8000:5000 $result
CONTAINER_NAME='My-first-container1'
x=$(docker ps -q -f status=running -f name=$CONTAINER_NAME)
if [[ -n "$x" ]]; then
  echo 'Container exists'
else
  echo 'No container image'
fi
