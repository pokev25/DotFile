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
```


## lnav
```
wget https://github.com/tstack/lnav/releases/download/v0.7.3/lnav-0.7.3-linux-64bit.zip

unzip lnav-0.7.3-linux-64bit.zip
cp lnav-0.7.3/lnav /usr/local/bin
```

#update test






