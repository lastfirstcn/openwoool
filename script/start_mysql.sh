#!/bin/sh

docker run \
    --detach \
    --name=woooldb \
    --env="MYSQL_ROOT_PASSWORD=123456" \
    -p 127.0.0.1:3306:3306 \
    --volume=/root/docker/woooldb/conf.d:/etc/mysql/conf.d \
    --volume=/root/docker/mysql-data:/var/lib/mysql \
    mysql:5.6.51
