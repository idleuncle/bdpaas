#!/bin/bash

CONTAINER_NAME=$1
CONTAINER_ID=`docker ps | grep $CONTAINER_NAME | awk '{print $1}'`

echo "CONTAINER_NAME: $CONTAINER_NAME"
echo "CONTAINER_ID  : $CONTAINER_ID"

docker exec -it $CONTAINER_ID /bin/bash

