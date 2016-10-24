#!/bin/bash
#docker ps -a | grep Exited | gawk '{print $1}' | xargs docker kill
docker ps -a | grep Exited | gawk '{print $1}' | xargs docker rm
