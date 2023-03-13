#!/bin/bash

DOCKER_COMPOSE=docker-compose.yml
DOCKER_TXT=docker.txt

if [[ -f $DOCKER_COMPOSE ]]
then
	docker compose down
elif [[ -f $DOCKER_TXT ]]
then
	found_param=false
	while read -r line; do
		for param in $line; do
			if [[ $found_param = true ]]
			then
				sudo docker stop $param
				sudo docker rm $param
				break
			elif [[ $param == "--name" ]]
                        then
                                found_param=true
			fi
		done
		if [[ $found_param = true ]]
		then
			break
		fi
       	done < $DOCKER_TXT
else
	echo "no files found"
fi
