#!/bin/bash

#check mariadb.repo
#https://downloads.mariadb.org/mariadb/repositories

cp ./mariadb.repo /etc/yum.repos.d/mariadb.repo

yum -y update
yum -y install MariaDB-server MariaDB-client

systemctl start mariadb
