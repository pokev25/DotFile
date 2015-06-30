!/bin/sh

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -ivh epel-release-latest-6.noarch.rpm

yum -y update
yum -y install vim lrzsz git 

cp ./MariaDB.repo /etc/yum.repos.d
cp ./nginx.repo /etc/yum.repos.d

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

yum -y install MariaDB-server MariaDB-client
yum -y install nginx php54w-fpm php54w-mysql php54w-pecl-zendopcache php54w-xml php54w-mbstring php54w-pdo php54w-gd

yum -y install vsftpd

yum -y install fail2ban htop

cp .tmux.conf ~/
cp .vimrc ~/
chown +x tmx 
mv tmx /usr/local/bin
