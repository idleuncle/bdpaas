#!/bin/bash

if [ $# = 0 ]; then
	echo "Usage: $0 <IMAGE_NAME> [TAG=latest]"
	exit -1
fi

if [ $# = 1 ]; then
	IMAGE_NAME=$1
	TAG=latest
else
	IMAGE_NAME=$1
	TAG=$2
fi

image_digest=`curl  -i -X GET  http://$PRIVATE_REGISTRY/v2/${IMAGE_NAME}/manifests/${TAG} 2>/dev/null | grep Docker-Content-Digest | sed 's/\(.*\)Docker-Content-Digest: \(.*\)\r/\2/g'`

echo $image_digest
