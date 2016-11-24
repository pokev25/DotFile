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
my.cnf
```
[client-server]

[client]
default-character-set=utf8mb4

[mysql]
default-character-set=utf8mb4

[mysqld]
collation-server=utf8mb4_unicode_ci
init-connect='SET NAMES utf8mb4'
character-set-server=utf8mb4
lower_case_table_names=1
innodb_file_format=barracuda
innodb_large_prefix=on
```

확인
```
MariaDB [mysql]> show variables like 'innodb_file_format';
+--------------------+-----------+
| Variable_name      | Value     |
+--------------------+-----------+
| innodb_file_format | Barracuda |
+--------------------+-----------+
```
사용자

```
create user 'dbuser'@'localhost' IDENTIFIED BY 'dbpass';
create user 'dbuser'@'%' IDENTIFIED BY 'dbpass';

create database userdb DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_bin;

GRANT ALL ON userdb.* to 'dbuser'@'localhost';
GRANT ALL ON userdb.* to 'dbuser'@'%';
```
