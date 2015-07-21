#!/bin/bash

# el, epel, remi  저장소 추가
EL_REPO ='http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm'
EPEL ='https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm'
REMI ='http://rpms.remirepo.net/enterprise/remi-release-6.rpm'

yum -y --nogpgcheck install "${EL_REPO}" >/dev/null
yum -y --nogpgcheck install "${EPEL}" >/dev/null
yum -y --nogpgcheck install "${REMI}" >/dev/null

# mariadb, nginx 저장소 추가
cp ./MariaDB_10.repo /etc/yum.repos.d/MariaDB.repo
#cp ./nginx.repo /etc/yum.repos.d

# 기본 설치 프로그램
yum -y update
yum -y install MariaDB-server MariaDB-client
yum -y install httpd
yum -y install php-fpm php-mysql php-pecl-zendopcache php-xml php-mbstring php-pdo php-gd
yum -y install fail2ban htop tmux vsftpd vim lrzsz wget lftp
yum -y install java-1.8.0-openjdk-devel

. ./setting.sh
