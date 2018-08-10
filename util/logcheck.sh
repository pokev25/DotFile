#! /bin/bash

if [ `tail -n 10 /var/log/httpd/error_log | grep mysqli_connect | wc -l` != 0 ]; then
    /usr/local/bin/telegram-notify --error --title "IDC" --text "mysql 접속 문제 확인!!!"
    /usr/local/bin/telegram-notify --text "`tail -n 3 /var/log/httpd/error_log`"
fi
