#!/bin/bash

# epel, remi  저장소 추가
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-6.rpm

# mariadb, nginx 저장소 추가
#cp ./MariaDB_10.repo /etc/yum.repos.d/MariaDB.repo
#cp ./nginx.repo /etc/yum.repos.d

# 기본 설치 프로그램
yum -y update
#yum -y install MariaDB-server MariaDB-client
#yum -y install nginx php54w-fpm php54w-mysql php54w-pecl-zendopcache php54w-xml php54w-mbstring php54w-pdo php54w-gd
yum -y install fail2ban htop tmux vsftpd vim lrzsz wget lftp
yum -y install java-1.8.0-openjdk-devel

. ./setting.sh
