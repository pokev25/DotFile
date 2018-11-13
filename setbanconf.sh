#!/bin/bash

BANHOME="fail2ban"
FILTER="${BANHOME}/filter.d"
JAIL="${BANHOME}/jail.d"


function copylocal() {
  SRC="./${FILTER}/$1.local"
  DST="/etc/${FILTER}/$1.local"
  cp $SRC $DST
}

function copyconf() {
  SRC="./${FILTER}/$1.conf"
  DST="/etc/${FILTER}/$1.conf"
  cp $SRC $DST
}

function copyjail() {
  SRC="./${BANHOME}/jail.local"
  DST="/etc/${BANHOME}/jail.local"
  cp $SRC $DST
}

function copyconf() {
  copylocal badbot
  copyconf badbot
  copyjail
}

if [ -d /etc/fail2ban ]; then
  copyconf
fi
