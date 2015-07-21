#!/bin/bash

REPO_URL='http://repo.puphpet.com/centos/httpd24/httpd-2.4.10-RPM-full.x86_64.tgz'
SAVE_TO='~/httpd-2.4.tgz'
EXTRACT_TO='~/http-2.4'

wget --quiet --tries=5 --connect-timeout=10 -O "${SAVE_TO}" "${REPO_URL}"

mkdir -p "${EXTRACT_TO}" && tar xzf "${SAVE_TO}" -C "${EXTRACT_TO}" --strip-components=1

cd "${EXTRACT_TO}"

#yum -y localinstall * --skip-broken


