#!/bin/bash 

rpm --import http://packages.atrpms.net/RPM-GPG-KEY.atrpms

rpm -ivh http://dl.atrpms.net/all/atrpms-repo-6-7.el6.x86_64.rpm

yum -y --enablerepo=atrpms install ffmpeg ffmpeg-devel

yum -y install php-ffmpeg
