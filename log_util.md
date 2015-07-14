## geoip
```
yum install geoip perl-Geo-IP
mkdir /usr/local/geo
cd /usr/local/geo
wget  http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
wget  http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gzip -d GeoIP.dat.gz
gzip -d GeoLiteCity.dat.gz
``` 
## goaccess
install
http://goaccess.io/download

```
wget http://tar.goaccess.io/goaccess-0.9.2.tar.gz
tar -xzvf goaccess-0.9.2.tar.gz
cd goaccess-0.9.2/
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
geoip-database /usr/local/geo/GeoLiteCity.dat
```

cron : 실시간 로그 10분마다 index로 생성
```
crontab -e
*/10 * * * * /root/bin/goaccess-10.sh

vim goaccess-10.sh
#!/bin/bash
cat /var/log/nginx/access.log* | /usr/local/bin/goaccess -a > /var/www/log/report.html
mv /var/www/log/report.html /var/www/log/index.html
```
goaccess-weekly : 압축 로그 분석 일주일마다 월별 파일로 생성
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






