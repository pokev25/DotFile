#!/bin/bash

#https://rpms.remirepo.net/wizard/
# centos 7, php 7

#install remirepo
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

#enable remirepo use single php
yum -y install yum-utils
yum-config-manager --enable remi-php70

yum -y update

#install php-fpm
yum -y install php-cli php-fpm php-mysql php-pecl-zendopcache php-xml php-mbstring php-pdo php-gd
#install php
yum -y install php php-mysql php-pecl-zendopcache php-xml php-mbstring php-pdo php-gd

systemctl enable php-fpm
systemctl start php-fpm
