#!/bin/bash

docker_image_name="sql-operations-studio"
docker_image_version="latest"
docker_repository="erikjandevries"

docker_image_id="${docker_repository}/${docker_image_name}:${docker_image_version}"

mount_dir="/mnt"

# Prepare data folders
sudo mkdir -p $HOME/.docker-apps/sqlops
sudo chown $USER:$USER $HOME/.docker-apps/sqlops
mkdir -p $HOME/.docker-apps/sqlops/.config
mkdir -p $HOME/.docker-apps/sqlops/.pki
mkdir -p $HOME/.docker-apps/sqlops/.sqlops
mkdir -p $HOME/.docker-apps/sqlops/.sqlsecrets
