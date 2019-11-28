#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")



PHP_VER=53
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"


PHP_VER=54
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"

PHP_VER=55
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"


PHP_VER=56
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"


PHP_VER=70
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"


PHP_VER=71
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"


PHP_VER=72
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"



PHP_VER=73
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"


PHP_VER=74
echo "php${PHP_VER} -- start"
cd $DIR/php$PHP_VER && sh install.sh
dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
for i in $dir
do
	cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
done
echo "php${PHP_VER} -- end"

