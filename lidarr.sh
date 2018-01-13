#!/usr/bin/env bash

SERVICE="sonarr"
IMAGE="bluefishforsale/lidarr"
VERSION="latest"
LOCALDIR="/data01/services/${SERVICE}"
DOWNLOADS="/data01/complete"

docker stop ${SERVICE}
docker rm ${SERVICE}


sudo docker run -d \
  --cpus=2 \
  --restart=always \
  --name=${SERVICE} \
  --hostname=${HOSTNAME} \
  -v /etc/localtime:/etc/localtime:ro \
  -e PUID=1001 -e PGID=1001 \
  -p 8686:8686 \
  -v ${LOCALDIR}:/config \
  -v ${DOWNLOADS}:/music \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
