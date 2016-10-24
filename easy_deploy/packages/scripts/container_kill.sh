#!/bin/bash

CONTAINER_NAME=$1
CONTAINER_ID=`docker ps -a | grep $CONTAINER_NAME | awk '{print $1}'`
echo "docker kill $CONTAINER_ID"
docker kill $CONTAINER_ID

