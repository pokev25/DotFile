## vsftpd 설정

    vim /etc/vsftpd/vsftpd.conf

    anonymous_enable=NO

    chroot_local_user=YES
    chroot_list_enable=YES
    chroot_list_file=/etc/vsftpd/chroot_list

    touch /etc/vsftpd/chroot_list

    