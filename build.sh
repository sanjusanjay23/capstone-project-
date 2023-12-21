#!/bin/bash
#set the image 
 IMAGENAME="my-reactapp"

#build the image
 docker build -t $IMAGENAME .
 #tag the image
 docker tag $IMAGENAME sanjusanjay23/$IMAGENAME


