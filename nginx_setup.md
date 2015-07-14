## php-fpm 설정

    vim /etc/php-fpm/www.conf

    listen = /var/run/php-fpm/php5-fpm.sock

    listen.owner = nginx
    listen.group = nginx
    listen.mode = 0666

    user = nginx
    group = nginx

## php-fpm 세션 생성 경로 확인

    /var/lib/php/session
    chown nginx:nginx session


## nginx 설정 (homestead 설정을 사용함)

    server {
        listen 80;
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
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/var/run/php-fpm/php5-fpm.sock;
            fastcgi_index index.php;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_intercept_errors off;
            fastcgi_buffer_size 16k;
            fastcgi_buffers 4 16k;
        }

        location ~ /\.ht {
            deny all;
        }
    }
    server {
        listen 443;
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
        error_log  /var/log/nginx/code.app-ssl-error.log error;

        sendfile off;

        client_max_body_size 100m;

        location ~ \.php$ {
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/var/run/php-fpm/php5-fpm.sock;
            fastcgi_index index.php;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
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



