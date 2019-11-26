#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")



# PHP_VER=53
# echo "php${PHP_VER} -- start"
# cd $DIR/php$PHP_VER && sh install.sh
# cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
# #cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/memcache && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/gearman && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/xhprof && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/solr && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/scws && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/opcache && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
# echo "php${PHP_VER} -- end"


# PHP_VER=54
# echo "php${PHP_VER} -- start"
# cd $DIR/php$PHP_VER && sh install.sh
# cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/memcache && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/gearman && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/xhprof && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/solr && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/scws && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/opcache && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
# echo "php${PHP_VER} -- end"

PHP_VER=55
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcache && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gearman && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/xhprof && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/solr && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/scws && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/xdebug && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/protobuf && sh install.sh $PHP_VER
echo "php${PHP_VER} -- end"


PHP_VER=56
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcache && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gearman && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/xhprof && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/solr && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/scws && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/xdebug && sh install.sh $PHP_VER
echo "php${PHP_VER} -- end"


PHP_VER=70
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/md_xhprof && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaconf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/solr && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/xdebug && sh install.sh $PHP_VER
echo "php${PHP_VER} -- end"


PHP_VER=71
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/md_xhprof && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaconf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/solr && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/xdebug && sh install.sh $PHP_VER
echo "php${PHP_VER} -- end"


PHP_VER=72
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/md_xhprof && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaconf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/xdebug && sh install.sh $PHP_VER
echo "php${PHP_VER} -- end"



PHP_VER=73
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/memcached && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/redis && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yaf && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/msgpack && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/vld && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/seaslog && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/md_xhprof && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
echo "php${PHP_VER} -- end"


PHP_VER=74
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
cd $DIR/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/imagick && sh install.sh $PHP_VER
# cd $DIR/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mcrypt && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/gettext && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/igbinary && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/mosquitto && sh install.sh $PHP_VER
cd $DIR/php$PHP_VER/pcntl && sh install.sh $PHP_VER
echo "php${PHP_VER} -- end"

