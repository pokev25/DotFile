설치방법
===

centos 7  기준repo설정

make mariadb.repo
https://downloads.mariadb.org/mariadb/repositories/

설치
```
yum -y update
yum -y install MariaDB-server MariaDB-client
```

설정
```
systemctl start mariadb
mysql_secure_installation
firewall-cmd --permanent --add-port=3306/tcp
```

접속제한 해제
```
mysql -uroot -p mysql
grant all privileges on *.* to 'root'@'%' identified by 'password';
```
