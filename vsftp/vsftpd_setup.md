# vsftpd 설정

vim /etc/vsftpd/vsftpd.conf

```conf
anonymous_enable=NO

chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd/chroot_list
allow_writeable_chroot=YES
```

```sh
sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' /etc/vsftpd/vsftpd.conf
sed -i 's/local_umask=002/local_umask=022/g' /etc/vsftpd/vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd/vsftpd.conf
sed -i 's/#chroot_list_enable=YES/chroot_list_enable=YES/g' /etc/vsftpd/vsftpd.conf
sed -i 's/#chroot_list_file=\/etc\/vsftpd\/chroot_list/chroot_list_file=\/etc\/vsftpd\/chroot_list/g' /etc/vsftpd/vsftpd.conf
sed -i'' -r -e "/chroot_list_file=\/etc\/vsftpd\/chroot_list/a\allow_writeable_chroot=YES" /etc/vsftpd/vsftpd.conf
```

touch /etc/vsftpd/chroot_list

방화벽

```ch
firewall-cmd --permanent --add-service=ftp
firewall-cmd --permanent --add-port=64000-65535/tcp
firewall-cmd --reload
```

CentOS 7 vsftp 3.*  로그인 에러 발생시

```conf
allow_writeable_chroot=YES
```

selinux 설정

```sh
getsebool -a | grep ftp
ftp_home_dir --> off
setsebool -P tftp_home_dir on
setsebool -P ftpd_full_access on
```

systemctl start vsftpd
systemctl enable vsftpd

## add virtual user

[https://wiki.centos.org/HowTos/Chroot_Vsftpd_with_non-system_users]

```sh
yum -y install vsftpd db4-utils
# 기본 환경 설정
vsftpd_virtual_config.sh
# 사용자 추가
vsftpd_virtualuser_add.sh
```

원본은 CentOS 6 용이라서 CentOS 7 에서는 몇가지 오류가 발생하여
스크립트를 CentOS 7 용으로 수정함

## 다중 포트 구성

[https://www.mankier.com/8/vsftpd]

```txt
1. Single daemon using default /etc/vsftpd/vsftpd.conf configuration file
# systemctl {start,stop,...} vsftpd[.service]

2. Single daemon using /etc/vsftpd/<conf-name>.conf
# systemctl {start,stop,...} vsftpd@<conf-name>[.service]

3. All instances together
# systemctl {restart,stop} vsftpd.target
```

## 로컬 유저와 동시 사용

기본 vsftpd 인증은 /etc/pam.d/vsftpd 파일이고
스크립트를 실행하면서 생긴 파일은 /etc/pam.d/ftp파일이다.
관리 스크립트에 해당 내용 추가하였음

```sh
vim /etc/pam.d/ftp
```

```conf
#%PAM-1.0
# virtual users
auth    sufficient pam_userdb.so db=/etc/vsftpd/accounts
account sufficient pam_userdb.so db=/etc/vsftpd/accounts
#Local users
auth    include   vsftpd
account include   vsftpd
```
