#!/bin/bash

cd $(cd `dirname $0`; pwd) && . ./config

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

echo Stop ${CONTAINER_NAME} done.

