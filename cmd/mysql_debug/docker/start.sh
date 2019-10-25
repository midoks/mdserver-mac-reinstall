#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

echo "123123"

/usr/local/mysql56/bin/mysqld_safe &

/usr/local/mysql56/bin/mysqladmin -u root password 'root'


/usr/local/mysql56/scripts/mysql_install_db --basedir=/usr/local/mysql56 --datadir=/usr/local/mysql56/data --user=mysql &

