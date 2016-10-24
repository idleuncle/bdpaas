#!/bin/bash

if [ $# = 0 ]; then
	echo "Usage: $0 <IMAGE> [TAG=latest]"
	exit -1
fi

if [ $# = 1 ]; then
	IMAGE=$1
	TAG=latest
else
	IMAGE=$1
	TAG=$2
fi

PRIVATE_IMAGE=$PRIVATE_REGISTRY/$IMAGE

DIGEST=`registry_get_image_digest.sh $IMAGE $TAG`
echo "Delete PRIVATE_IMAGE $PRIVATE_IMAGE. "
echo "Digest: ${DIGEST}."

curl -X DELETE http://$PRIVATE_REGISTRY/v2/$IMAGE/manifests/${DIGEST}

echo "Done."
