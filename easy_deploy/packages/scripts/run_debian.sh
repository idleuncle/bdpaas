#!/bin/bash

docker run -itd --name mydebian -v `pwd`/mydebian/volumes/var/log:/var/log debian:8.4 /bin/bash
