#! /bin/sh
DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")


echo '' > $DIR/logs/php_fpm.log
echo '' > $DIR/logs/php_fpm_error.log
echo "sh $DIR/php/status_log.sh $1 $2" > $DIR/logs/php_fpm.log
/bin/sh $DIR/php/status_log.sh $1 $2 >> $DIR/logs/php_fpm.log 2>$DIR/logs/php_fpm_error.log