#!/bin/bash

source config.sh

echo "Granting root user access to X display"
xhost +si:localuser:root

echo "Entering shell for Docker image: ${docker_image_id}"
docker run -it --rm \
    --name ${docker_image_name} \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY" \
    --device=/dev/dri:/dev/dri \
    --volume ${mount_dir}:${mount_dir} \
    --entrypoint="/bin/bash" \
    ${docker_image_id}

echo "Revoking root user access to X display"
xhost -si:localuser:root
