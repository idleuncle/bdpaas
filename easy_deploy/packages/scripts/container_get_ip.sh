#!/bin/bash

CONTAINER_NAME=$1
CONTAINER_ID=`docker ps -a | grep $CONTAINER_NAME | awk '{print $1}'`
CONTAINER_IP=`docker inspect --format "{{.NetworkSettings.IPAddress}}" $CONTAINER_ID`
echo $CONTAINER_IP

