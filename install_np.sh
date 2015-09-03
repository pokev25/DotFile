#!/bin/bash

# add epel, remi repo 
yum -y install epel-release

REMI=http://rpms.remirepo.net/enterprise/remi-release-6.rpm
yum -y --nogpgcheck install ${REMI} >/dev/null

# add mariadb, nginx repo
cp ./MariaDB_55.repo /etc/yum.repos.d/MariaDB.repo
cp ./nginx.repo /etc/yum.repos.d

# install single server nginx,mariadb,php-fpm and utils
yum -y install yum-utils
yum-config-manager --enable remi
yum -y update
yum -y install nginx
yum -y install php-cli php-fpm php-mysql php-pecl-zendopcache php-xml php-mbstring php-pdo php-gd
yum -y install fail2ban htop vsftpd 
yum -y install tmux vim lrzsz wget lftp
yum -y install java-1.8.0-openjdk-devel
