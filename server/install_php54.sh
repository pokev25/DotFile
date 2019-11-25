#!/bin/bash

# https://rpms.remirepo.net/wizard/
# centos 6, php 5.4

#install remirepo
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum -y install http://rpms.remirepo.net/enterprise/remi-release-6.rpm

#enable remirepo
yum -y install yum-utils
yum-config-manager --enable remi-php54

yum -y update

#install php
yum -y install php-cli php-fpm php-mysqlnd php-pecl-zendopcache php-xml php-mbstring php-pdo php-gd
