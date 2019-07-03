#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin



DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


mkdir -p $MDIR/source/gearman

PHP_VER=54
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongo && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=55
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongo && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=56
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongo && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"



PHP_VER=70
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=71
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=72
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=73
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=74
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"
