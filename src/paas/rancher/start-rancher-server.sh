#!/bin/bash

docker run -d --name rserver_01 --restart=always -p 8080:8080 rancher/server
