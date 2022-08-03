## geoip
```
yum install geoip perl-Geo-IP
mkdir /usr/local/share/GeoIP
cd /usr/local/share/GeoIP
wget  http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
wget  http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gzip -d GeoIP.dat.gz
gzip -d GeoLiteCity.dat.gz
``` 
## goaccess
install
http://goaccess.io/download

if need dependency

```
yum install geoip-devel ncurses-devel glib2-devel zlib-devel bzip2-devel
```

```
wget http://tar.goaccess.io/goaccess-0.9.4.tar.gz
tar -xzvf goaccess-0.9.4.tar.gz
cd goaccess-0.9.4/
./configure --enable-geoip --enable-utf8
make
make install
```
config
```
vim /usr/local/etc/goaccess.conf
time-format %T
date-format %d/%b/%Y
log-format %h %^[%d:%t %^] "%r" %s %b "%R" "%u"

std-geoip true
geoip-database /usr/local/share/GeoIP/GeoLiteCity.dat
```

cron : 30분마다 로그 생성
```
crontab -e
*/30 * * * * /root/bin/goaccess-log.sh

vim goaccess-log.sh
#!/bin/bash
cat /var/log/nginx/access.log* | /usr/local/bin/goaccess -a > /var/www/log/report.html
mv /var/www/log/report.html /var/www/log/index.html
```
goaccess-weekly : 압축 로그 분석 
```
#!/bin/bash

DATE=$(date +'%Y.%m')
zcat `find /var/log/nginx/ -name "access.log*.gz" -mtime -35` | goaccess > /var/www/log/monthly-$DATE.html
```

## lnav
```
wget https://github.com/tstack/lnav/releases/download/v0.7.3/lnav-0.7.3-linux-64bit.zip

unzip lnav-0.7.3-linux-64bit.zip
cp lnav-0.7.3/lnav /usr/local/bin
```






