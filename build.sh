#!/bin/bash

source config.sh

echo "Building Docker image: ${docker_image_id}"

sudo docker build -t ${docker_image_id} .
#sudo docker image prune -f

# docker push ${image_name}
