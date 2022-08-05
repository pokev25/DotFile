# vsftpd 설정

vim /etc/vsftpd/vsftpd.conf

```conf
anonymous_enable=NO

chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd/chroot_list
allow_writeable_chroot=YES
```

touch /etc/vsftpd/chroot_list

방화벽

```ch
firewall-cmd --permanent --add-service=ftp
firewall-cmd --permanent --add-port=33000-34000/tcp
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

## 두개의 포트 구동

vsftpd.conf 를 vsftpd2.conf 로 복사 하고 사용할 포트를 지정하고
다음과 같이 각각 구동한다.

```sh
# 각각 구동
systemctl start vsftpd
systemctl start vsftpd.target
# 둘다 실행되었는지 확인
ps -ef | grep vsftp
```

## 로컬 유저와 동시 사용

기본 vsftpd 인증은 /etc/pam.d/vsftpd 파일이고
스크립트를 실행하면서 생긴 파일은 /etc/pam.d/ftp파일이다.
다음과 같이 스크립트를 수정해야 각각의 인증 체계로 로그인이 가능하다.

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
