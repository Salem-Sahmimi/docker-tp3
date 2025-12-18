#!/bin/bash

docker network rm tp3_net 2>/dev/null
docker network create tp3_net

docker rm -f http script data 2>/dev/null

docker run -d \
  --name data \
  --network tp3_net \
  -e MARIADB_RANDOM_ROOT_PASSWORD=yes \
  -e MARIADB_DATABASE=tp3 \
  -e MARIADB_USER=tp3user \
  -e MARIADB_PASSWORD=tp3pass \
  -v $(pwd)/initdb:/docker-entrypoint-initdb.d \
  mariadb

docker build -t php-tp3 .

docker run -d \
  --name script \
  --network tp3_net \
  -v $(pwd)/src:/app \
  php-tp3

docker run -d \
  --name http \
  --network tp3_net \
  -p 8080:8080 \
  -v $(pwd)/src:/app \
  -v $(pwd)/config/default.conf:/etc/nginx/conf.d/default.conf \
  nginx
