#!/bin/bash
if [[ "$1" != "publish" ]]; then
	echo "usage: ./publish-hass-addon.sh publish"
	exit 1
fi

docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock:ro -v ~/.docker:/root/.docker -v  /home/keary/work/personal-projects/ha/flair-mqtt-hass-addon/:/data homeassistant/amd64-builder --all -t /data
