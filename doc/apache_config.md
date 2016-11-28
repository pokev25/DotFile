httpd 설정
---

CentOS 기본 설치 아파치 설정

사용자 기본 디렉토리
```
cd /etc/skel
mkdir public_html
cd public_html
echo Hello > index.html
```

vim /etc/httpd/conf/httpd.conf
```
KeepAlive On

<IfModule prefork.c>
StartServers        8
MinSpareServers     5
MaxSpareServers    20
ServerLimit       256
MaxClients        256
MaxRequestsPerChild  4000
</IfModule>

<IfModule worker.c>
StartServers         4
MaxClients         300
MinSpareThreads     25
MaxSpareThreads     75
ThreadsPerChild     25
MaxRequestsPerChild  0
</IfModule>

ServerName servername:80

<Directory /home/*/public_html>
    AllowOverride FileInfo AuthConfig Limit
    Options MultiViews SymLinksIfOwnerMatch IncludesNoExec
    <Limit GET POST OPTIONS>
        Order allow,deny
        Allow from all
    </Limit>
    <LimitExcept GET POST OPTIONS>
        Order deny,allow
        Deny from all
    </LimitExcept>
</Directory>
```

add conf
---
deflate.conf
```
#cache
<IfModule mod_expires.c>
  ExpiresActive On

  ExpiresByType text/xml "access plus 1 month"
  ExpiresByType application/x-shockwave-flash "access plus 1 month"
  ExpiresByType image/jpeg "access plus 1 month"
  ExpiresByType image/gif "access plus 1 month"
  ExpiresByType image/png "access plus 1 month"
  ExpiresByType application/pdf "access plus 1 month"

</IfModule>


#압축 설정
<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/plain text/html text/xml
  AddOutputFilterByType DEFLATE application/xhtml+xml application/xml application/rss+xml
  AddOutputFilterByType DEFLATE text/css application/javascript application/x-javascript
  AddOutputFilterByType DEFLATE audio/midi

 # DeflateCompressionLevel 9

  BrowserMatch ^Mozilla/4 gzip-only-text/html   # Netscape 4.xx에는 HTML만 압축해서 보냄
  BrowserMatch ^Mozilla/4\.0[678] no-gzip   # Netscape 4.06~4.08에는 압축해서 보내지 않음
  BrowserMatch \bMSIE !no-gzip !gzip-only-text/html   # 자신을 Mozilla로 알리는 MSIE에는 그대로 압축해서 보냄
</IfModule>
```
