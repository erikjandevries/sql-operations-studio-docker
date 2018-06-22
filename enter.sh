#!/bin/bash

source config.sh

echo "Entering shell for Docker image: ${docker_image_id}"
docker run -it --rm \
    --name ${docker_image_name} \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --env="DISPLAY" \
    --device /dev/dri \
    --device /dev/snd \
    --volume ${mount_dir}:${mount_dir} \
    --volume $HOME/.docker-apps/sqlops/.config:/home/johndoe/.config \
    --volume $HOME/.docker-apps/sqlops/.pki:/home/johndoe/.pki \
    --volume $HOME/.docker-apps/sqlops/.sqlops:/home/johndoe/.sqlops \
    --volume $HOME/.docker-apps/sqlops/.sqlsecrets:/home/johndoe/.sqlsecrets \
    --env USER=$USER \
    --env UID=$UID \
    --entrypoint="/bin/bash" \
    ${docker_image_id}
