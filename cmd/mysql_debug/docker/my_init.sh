#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


/usr/local/mysql56/scripts/mysql_install_db --basedir=/usr/local/mysql56 --datadir=/usr/local/mysql56/data --user=mysql

# /usr/local/mysql56/bin/mysqld_safe --user=mysql &

/usr/local/mysql56/bin/mysqld_safe --debug --user=mysql &

sleep 3

/usr/local/mysql56/bin/mysqladmin -u root password 'root'

echo "grant all PRIVILEGES on *.*  to root@'%'  identified by 'root'" > /tmp.sql
/usr/local/mysql56/bin/mysql -uroot -proot < tmp.sql