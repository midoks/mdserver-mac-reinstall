#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


sh $MDIR/bin/reinstall/cmd/base/cmd_icu.sh


mkdir -p $MDIR/source
mkdir -p $MDIR/bin/logs/reinstall


echo "" > $MDIR/bin/logs/reinstall/cmd_php-ext-init_install.log

# PHP_VER=54
# echo "php${PHP_VER}  -- init -- start"
# cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/yar && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/mongo && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
# cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
# echo "php${PHP_VER}  -- init -- end"


PHP_VER=55
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongo && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=56
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongo && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"



PHP_VER=70
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gettext && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=71
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gettext && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=72
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gettext && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=73
echo "php${PHP_VER}  -- init -- start"
cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/yar && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gettext && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"


PHP_VER=74
echo "php${PHP_VER}  -- init -- start"
# cd $MDIR/bin/reinstall/php$PHP_VER/intl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/openssl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/curl && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/rdkafka && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/swoole && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/imagick && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/mongodb && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/iconv && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gd && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/bcmath && sh install.sh $PHP_VER
cd $MDIR/bin/reinstall/php$PHP_VER/gettext && sh install.sh $PHP_VER
echo "php${PHP_VER}  -- init -- end"

