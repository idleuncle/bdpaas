#!/bin/bash

CONTAINER_NAME=$1
CONTAINER_ID=`docker ps -a | grep $CONTAINER_NAME | awk '{print $1}'`
echo "docker rm $CONTAINER_ID"
docker rm $CONTAINER_ID

