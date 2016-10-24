#!/bin/bash

docker run -itd --name myubuntu -v `pwd`/myubuntu/volumes/var/log:/var/log ubuntu:14.04 /bin/bash
