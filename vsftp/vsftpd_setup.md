## vsftpd 설정

vim /etc/vsftpd/vsftpd.conf

```
anonymous_enable=NO

chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd/chroot_list
```
touch /etc/vsftpd/chroot_list

방화벽

```
firewall-cmd --permanent --add-service=ftp
firewall-cmd --permanent --add-port=33000-34000
firewall-cmd --reload
```

CentOS 7 vsftp 3.*  로그인 에러 발생시
```
allow_writeable_chroot=YES
```

selinux 설정
```
getsebool -a | grep ftp
ftp_home_dir --> off
setsebool -P ftp_home_dir on
setsebool -P allow_ftpd_full_access on
```

systemctl start vsftpd
systemctl enable vsftpd
