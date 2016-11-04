centos 6 redis 설정
===================

remi repo에서 배포하는 redis 설치

```
yum -y install redis

vim /etc/redis.conf
;접속을 허용할 인터페이스를 정한다.
bind 127.0.0.1
;패스워드
requirepass yourverycomplexpasswordhere
```

```
yum -y install php-redis

; php-fpm 인경우 다음의 설정을 수정해야 적용된다.
vim /etc/php-fpm.d/www.conof

php_value[session.save_handler] = redis
php_value[session.save_path] = "tcp://localhost:6379?auth=yourverycomplexpasswordhere"
```
