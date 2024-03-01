#!/bin/bash

docker-compose up -d --remove-orphans --build

docker container exec -i $(docker-compose ps -q web) bash -c "service php8.3-fpm start && service nginx start && cd /server/http && composer update && chmod 777 -R .env cache "