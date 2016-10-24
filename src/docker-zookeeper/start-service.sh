#!/bin/bash

cd $(cd `dirname $0`; pwd) && . ./config

docker run -d \
    --name ${CONTAINER_NAME} \
    --net="host" \
    -p 2188:2188 \
    -p 2888:2888 \
    -p 3888:3888 \
    -e MYID=${MYID} \
    -e ADDITIONAL_ZOOKEEPER_1=server.1=${ZOOKEEPER_NODE_1}:2888:3888 \
    -e ADDITIONAL_ZOOKEEPER_2=server.2=${ZOOKEEPER_NODE_2}:2888:3888 \
    -e ADDITIONAL_ZOOKEEPER_3=server.3=${ZOOKEEPER_NODE_3}:2888:3888 \
    ${VOLUMES_OPTS} \
    uu/docker-zookeeper
