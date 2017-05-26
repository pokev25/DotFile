#!/bin/bash

cp ./nginx.repo /etc/yum.repos.d

yum -y update
yum -y install nginx
