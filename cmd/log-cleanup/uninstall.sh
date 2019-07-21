#! /bin/sh

SDIR=$(cd "$(dirname "$0")"; pwd)
SDIR=$(dirname "$SDIR")
SDIR=$(dirname "$SDIR")
SDIR=$(dirname "$SDIR")
MDIR=$(dirname "$SDIR")

DIR=$(cd "$(dirname "$0")"; pwd)

echo '' > $MDIR/bin/logs/reinstall/cmd_log-cleanup_install.log

echo '' >  $MDIR/bin/logs/php_fpm_error.log
echo '' >  $MDIR/bin/logs/php_fpm.log
echo '' >  $MDIR/bin/logs/memcached_err.log
echo '' >  $MDIR/bin/logs/memcached.log
echo '' >  $MDIR/bin/logs/mongodb_err.log
echo '' >  $MDIR/bin/logs/mongodb.log
echo '' >  $MDIR/bin/logs/redis_err.log
echo '' >  $MDIR/bin/logs/redis.log
echo '' >  $MDIR/bin/logs/start_err.log
echo '' >  $MDIR/bin/logs/start.log
echo '' >  $MDIR/bin/logs/stop_err.log
echo '' >  $MDIR/bin/logs/stop.log



if [ -f $MDIR/bin/php/php53/var/log/php-fpm.log ];then
	echo '' > $MDIR/bin/php/php53/var/log/php-fpm.log
	echo '' > $MDIR/bin/php/php53/var/log/www-slow.log
fi


echo '' > $MDIR/bin/php/php54/var/log/php-fpm.log
echo '' > $MDIR/bin/php/php54/var/log/www-slow.log
echo '' > $MDIR/bin/php/php55/var/log/php-fpm.log
echo '' > $MDIR/bin/php/php55/var/log/www-slow.log
echo '' > $MDIR/bin/php/php56/var/log/php-fpm.log
echo '' > $MDIR/bin/php/php56/var/log/www-slow.log
echo '' > $MDIR/bin/php/php70/var/log/php-fpm.log
echo '' > $MDIR/bin/php/php70/var/log/www-slow.log
echo '' > $MDIR/bin/php/php71/var/log/php-fpm.log
echo '' > $MDIR/bin/php/php71/var/log/www-slow.log
echo '' > $MDIR/bin/php/php72/var/log/php-fpm.log
echo '' > $MDIR/bin/php/php72/var/log/www-slow.log
echo '' > $MDIR/bin/php/php73/var/log/php-fpm.log
echo '' > $MDIR/bin/php/php73/var/log/www-slow.log


if [ -f $MDIR/bin/php/php74/var/log/php-fpm.log ];then
	echo '' > $MDIR/bin/php/php74/var/log/php-fpm.log
	echo '' > $MDIR/bin/php/php74/var/log/www-slow.log
fi

echo '' > $MDIR/bin/openresty/nginx/logs/error.log
echo '' > $MDIR/bin/openresty/nginx/logs/access.log

echo '' > $MDIR/bin/mysql/data/mysql.log

cd $MDIR/bin/logs/reinstall && rm ./*.log

echo 'ok!'