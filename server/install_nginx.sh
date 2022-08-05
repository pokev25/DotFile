#!/bin/bash

cp ./nginx.repo /etc/yum.repos.d

yum-config-manager --enable nginx-mainline
yum -y install nginx
