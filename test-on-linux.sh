#!/bin/sh
# to setup docker see README.md #testing-on-linux

current_datetime=$(date +"%Y%m%d_%H%M%S")
local_name="prankmind/dev_core_$current_datetime"

docker buildx build --platform linux/arm64 . -t $local_name -o "type=docker"
docker run --rm -it --platform linux/arm64 $local_name
docker image rm $local_name -f
