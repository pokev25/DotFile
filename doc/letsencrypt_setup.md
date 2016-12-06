#nginx 서버에서 letsencrypt 인증서 발급

환경 구성

도메인 접근 가능 하도록 구성
```
location /.well-known {
    alias /var/www/html/.well-known;
    autoindex off;
}
```

certbot 설치
https://certbot.eff.org/

centos 7  nginx
https://certbot.eff.org/#centosrhel7-nginx

yum install certbot

다이얼로그 형식으로 실행
certbot certonly
한줄 실행
certbot certonly --webroot -w /var/www/html/ -d example.com

인증서 경로
/etc/letsencrypt/live/example.com/fullchain.pem

dhparam
```
mkdir /etc/nginx/ssl
cd /etc/nginx/ssl
openssl dhparam -out yourdomain.com.pem 2048
```

cron 에 등록하여 자동 갱신
```
* * */90 * * certbot renew --quiet
```
