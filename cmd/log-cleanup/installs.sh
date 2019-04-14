#! /bin/sh

#flush log

DIR=$(cd "$(dirname "$0")"; pwd)

#echo $DIR

echo '' > $DIR/log/php_fpm_error.log
echo '' > $DIR/openresty/nginx/logs/error.log
echo '' > $DIR/openresty/nginx/logs/access.log
echo '' > $DIR/mysql/data/mysql.log

echo '' > $DIR/php/php55/var/log/php-fpm.log
echo '' > $DIR/php/php7/var/log/php-fpm.log
