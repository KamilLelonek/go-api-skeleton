#!/usr/bin/env bash
set -e

export APP_NAME=skeleton-api
export DOCKER_TAG=$(git rev-parse --short HEAD)

docker run \
  --rm -it $APP_NAME:$DOCKER_TAG $@
