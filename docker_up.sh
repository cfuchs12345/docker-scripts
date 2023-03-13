#!/bin/bash

DOCKER_COMPOSE=docker-compose.yml
DOCKER_TXT=docker.txt
DOCKER_CREATE_NETWORK_TXT=create_network.txt
DOCKER_PRE_UP=PRE_UP.txt
DOCKER_POST_UP=POST_UP.txt

if [[ -f $DOCKER_PRE_UP ]]
then
	bash $DOCKER_PRE_UP
fi


if [[ -f $DOCKER_COMPOSE ]]
then
	docker compose up -d
elif [[ -f $DOCKER_TXT ]]
then
	bash $DOCKER_TXT
else
	echo "no files found"
fi

if [[ -f $DOCKER_POST_UP ]]
then
        bash $DOCKER_POST_UP
fi
