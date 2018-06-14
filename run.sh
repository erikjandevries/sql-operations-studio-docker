#!/bin/bash

source config.sh

echo "Granting root user access to X display"
xhost +si:localuser:root

echo "Running Docker image: ${docker_image_id}"
docker run -d --rm \
    --name ${docker_image_name} \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY" \
    --device /dev/dri \
    --device /dev/snd \
    --volume ${mount_dir}:${mount_dir} \
    ${docker_image_id} $@

echo "Revoking root user access to X display"
xhost -si:localuser:root
