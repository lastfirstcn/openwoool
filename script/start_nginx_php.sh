#!/bin/sh

docker run \
    --detach \
    --name nginx-php5.6 \
    -p 81:80 \
    -v /opt/woool/wwwroot/html:/var/www \
    navidonskis/nginx-php5.6
