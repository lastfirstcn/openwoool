#!/bin/sh

export WOOOL_ROOT=`pwd`

cd $WOOOL_ROOT/linux/
bash $WOOOL_ROOT/linux/db_service.sh start 0001
bash $WOOOL_ROOT/linux/session_service.sh start 0001
bash $WOOOL_ROOT/linux/gamegate_service.sh start 0001 1
bash $WOOOL_ROOT/linux/world_service.sh start 0001
bash $WOOOL_ROOT/linux/nameserver_service.sh start 2

