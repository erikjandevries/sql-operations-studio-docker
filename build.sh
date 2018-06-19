#!/bin/bash

source config.sh

echo "Building Docker image: ${docker_image_id}"

sudo docker build -t ${docker_image_id} .
#sudo docker image prune -f

# docker push ${image_name}

echo "Creating directories to save settings"
mkdir -p $HOME/.docker-apps/sqlops/.config
mkdir -p $HOME/.docker-apps/sqlops/.pki
mkdir -p $HOME/.docker-apps/sqlops/.sqlops
mkdir -p $HOME/.docker-apps/sqlops/.sqlsecrets
