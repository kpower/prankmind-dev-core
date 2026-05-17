#!/bin/sh

current_datetime=$(date +"%Y%m%d_%H%M%S")
local_name="prankmind/dev_core_$current_datetime"

docker buildx build --platform linux/amd64 . -t $local_name -o "type=docker" -ulimit unlimited
docker run --rm -it --platform linux/amd64 $local_name
docker image rm $local_name -f
