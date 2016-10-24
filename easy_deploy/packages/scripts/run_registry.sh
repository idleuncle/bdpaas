#!/bin/bash
docker run -d -v /home/vagrant/sandbox/docker/registry-data:/var/lib/registry \
	-v `pwd`/registry-config.yml:/etc/docker/registry/config.yml \
        -p 5000:5000 --restart=always \
        --name private_registry registry:2.4.1
