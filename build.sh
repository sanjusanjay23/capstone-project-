#!/bin/bash

docker build -t react-image .
result=$( sudo docker images -q react-image )
if [[ -n "$result" ]]; then
  echo 'Container image exists'
else
  echo 'No such container image'
fi
