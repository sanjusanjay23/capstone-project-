#!/bin/bash
#set the image
IMAGENAME="myreactapp"
branch= returnStdout: true , script: git rev-parse --abbrev-ref HEAD
if [ '$branch' == 'dev' ] ; then
    docker build -t $IMAGENAME .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push sanjusanjay23/dev:latest
    docker logout
fi