#!/bin/bash

function copy10repo {
  cp ./MariaDB_10.repo /etc/yum.repos.d/MariaDB.repo
}

function copy5repo {
  cp ./MariaDB_55.repo /etc/yum.repos.d/MariaDB.repo
}

copy10repo
yum -y update
yum -y install MariaDB-server MariaDB-client

