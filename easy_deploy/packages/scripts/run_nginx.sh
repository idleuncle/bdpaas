#!/bin/bash

docker run -d --name mynginx -p 80:80 -v `pwd`/mynginx/volumes/var/log/nginx:/var/log/nginx nginx
