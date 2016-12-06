

nginx conf
----------

gzip
```
gzip             on;
gzip_comp_level  2;
gzip_min_length  1000;
gzip_proxied     expired no-cache no-store private auth;
gzip_types       text/plain application/x-javascript text/xml text/css application/xml;
```

nginx worker process
```
worker_processes  4;
worker_cpu_affinity 0001 0010 0100 1000;
```

nginx 설정 (homestead 설정을 일부 수정 80과 443 설정을 하나로함)
----------------------------------------------------------------

```
server {
    listen 80;
    listen 443 ssl;

    server_name code.app;
    root "/home/public";

    index index.html index.htm index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/code.app-error.log error;

    sendfile off;

    client_max_body_size 100m;

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php-fpm/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param REMOTE_ADDR $http_x_real_ip;
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
    }

    location ~ /\.ht {
        deny all;
    }

    ssl on;
    ssl_certificate     /etc/nginx/ssl/code.app.crt;
    ssl_certificate_key /etc/nginx/ssl/code.app.key;
}
```

nginx 문제수정
------------------

* 405 에러
 static 파일을 post로 요청하면 405에러 발생하면 다음설정을 추가
 error_page 405 = $uri;


letsencrypt ssl 설정
https://mozilla.github.io/server-side-tls/ssl-config-generator/
```
listen 443 ssl;
ssl_certificate /etc/letsencrypt/live/{domain}/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/{domain}/privkey.pem;
ssl_dhparam /etc/nginx/ssl/yourdomain.com.pem;
```

HSTS 설정
```
# HSTS (ngx_http_headers_module is required) (15768000 seconds = 6 months)
add_header Strict-Transport-Security max-age=15768000;
```
