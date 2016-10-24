#!/bin/bash

curl http://$PRIVATE_REGISTRY/v2/$1/tags/list
