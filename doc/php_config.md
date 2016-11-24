php-fpm 설정
------------

```
vim /etc/php-fpm.d/www.conf

listen = /var/run/php-fpm/php5-fpm.sock

listen.owner = nginx
listen.group = nginx
listen.mode = 0666

user = nginx
group = nginx

pm.max_children = 200
pm.max_requests = 500

security.limit_extensions = .php
```

php-fpm 세션 생성 경로 확인
---------------------------

```
/var/lib/php/session
chown nginx:nginx session
```

php.ini
-------

```
max_execution_time = 300
memory_limit = 128M
post_max_size = 50M
pload_max_filesize = 30M

date.timezone = "Asia/Seoul"
```
