#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

echo "start"

export MYSQL_DEBUG=d:t:O,/tmp/client.trace


if [ ! -f /init.lock ]; then
	/usr/local/mysql56/scripts/mysql_install_db --basedir=/usr/local/mysql56 --datadir=/usr/local/mysql56/data --user=mysql
	
	sleep 3

	/usr/local/mysql56/bin/mysqld_safe --debug --user=mysql &

	sleep 3

	/usr/local/mysql56/bin/mysqladmin -u root password 'root'

	echo "grant all PRIVILEGES on *.*  to root@'%'  identified by 'root'" > /tmp/tmp.sql
	/usr/local/mysql56/bin/mysql -uroot -proot < /tmp/tmp.sql
	rm -f /tmp/tmp.sql

	echo "" > /init.lock
fi

/usr/bin/supervisord -n -c /etc/supervisord.conf
