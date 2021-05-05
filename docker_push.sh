#!/bin/sh

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
docker push fragsoc/steamcmd-wine-xvfb
