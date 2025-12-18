#!/bin/bash

# Étape 1 – Nginx + PHP-FPM (sans Docker Compose)

# Création du réseau 
docker network create tp3-net 2>/dev/null

# Container PHP-FPM
docker container run -d \
  --name script \
  --network tp3-net \
  -v $(pwd)/src:/app \
  php:8.2-fpm

# Container Nginx
docker container run -d \
  --name http \
  --network tp3-net \
  -p 8080:80 \
  -v $(pwd)/src:/app \
  -v $(pwd)/config/default.conf:/etc/nginx/conf.d/default.conf \
  nginx:latest
