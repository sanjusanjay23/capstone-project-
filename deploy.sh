#!/bin/bash
#set the image
IMAGENAME="my-reactapp"
 BRANCH="$(git rev-parse --abbrev-ref HEAD)"
 #If  the branch is dev, build the image and push it to docker-hub dev repository
if [ "$BRANCH" == "dev" ]; then
    echo "Building image for dev branch "
    docker build -t $IMAGENAME .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker tag my-reactapp sanjusanjay23/dev
    docker push sanjusanjay23/dev:latest
    docker logout

elif [ "$BRANCH" == "prod" ]; then
      echo "Building image for prod branch ..."
      docker build -t $IMAGENAME .
      echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
      docker tag my-reactapp sanjusanjay23/prod
      docker push sanjusanjay23/prod:latest
      docker logout

fi

