#!/bin/bash

HOSTNAME="127.0.0.1"
PORT="3306"
USERNAME="root"
PASSWORD="123456"

DB1="longwen"
DB2="longwen_name"


#创建数据库
sql1="create database ${DB1} DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;"
sql2="create database ${DB2} DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;"



mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} -e "${sql1}"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} -e "${sql2}"


#还原数据库
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DB1} < ./sql/longwen.sql
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DB2} < ./sql/longwen_name.sql




