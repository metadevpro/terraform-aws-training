#!/usr/bin/env bash

## Launch containers
 
# portainer
docker run -d --name portainer -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer

# rabbitmq
docker run -d --hostname rabbit --name rabbit rabbitmq:alpine

# redis
docker run -d --name redis redis:alpine


# consul
docker run -d -p 8400:8400 -p 8500:8500 -p 8600:53/udp -h consul \
       --name=consul progrium/consul -server -bootstrap \
       -dc=sevilla -node=aljarafe

# mongodb
docker run --name mongodb -d -p 27017:27017 mongo:latest --storageEngine wiredTiger

# Documentation: https://hub.docker.com/_/mysql/
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=1234 -p 3306:3306 mysql

#neo4j from https://hub.docker.com/_/neo4j/
docker run \
	-d\
    --publish=7474:7474 \
	--publish=7473:7473 \
	--publish=7687:7687 \
    --volume=$HOME/neo4j/data:/data \
	--name neo4j \
    neo4j
