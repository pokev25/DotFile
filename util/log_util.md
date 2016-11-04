geoip
-----

```
yum install geoip perl-Geo-IP
mkdir /usr/local/share/GeoIP
cd /usr/local/share/GeoIP
wget  http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
wget  http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gzip -d GeoIP.dat.gz
gzip -d GeoLiteCity.dat.gz
```

goaccess
--------

install http://goaccess.io/download

https://gist.github.com/pokev25/f88c2ad04d27e42f68966eb13ad452c0

lnav
----

```
wget https://github.com/tstack/lnav/releases/download/v0.8.1/lnav-0.8.1-linux-64bit.zip

unzip lnav-0.8.1-linux-64bit.zip
cp lnav-0.8.1/lnav /usr/local/bin
```
