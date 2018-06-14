#!/bin/bash

docker_image_name="sql-operations-studio"
docker_image_version="latest"
docker_repository="erikjandevries"

docker_image_id="${docker_repository}/${docker_image_name}:${docker_image_version}"

mount_dir="/mnt/"
