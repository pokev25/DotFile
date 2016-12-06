ntp 설정
---

설치
---
```
yum -y install ntp
firewall-cmd --add-service=ntp --permanent
firewall-cmd --reload
```

설정 /etc/ntp.conf
---
```
server 0.asia.pool.ntp.org
server 1.asia.pool.ntp.org
server 2.asia.pool.ntp.org
server 3.asia.pool.ntp.org
```

구동 확인
---
```
systemctl start ntpd
systemctl enable ntpd
ntpq -p
```

timezone 설정
---
https://www.cyberciti.biz/faq/centos-linux-6-7-changing-timezone-command-line/

Centos 7
```
timedatectl set-timezone Asia/Seoul
```

Centos 6
```
cp /etc/localtime /root/old.timezone
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime
```

확인
```
date
ls -l /etc/localtime
```

selinux
---

쓰기 문제
https://blog.lysender.com/2015/07/centos-7-selinux-php-apache-cannot-writeaccess-file-no-matter-what/
```
chcon -Rt httpd_sys_content_t /data/www/html/sites/mysite
chcon -Rt httpd_sys_rw_content_t /data/www/html/sites/mysite/logs

chcon -Rt httpd_sys_content_t /var/www/html
```

enforce 0 : 로그만 남김
/var/log/audit/autit.log 확인


dnslookup 지연문제 : 재부팅하면 설정 확인필요함
--
vim /etc/resolv.conf
options single-request-reopen


방화벽
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
