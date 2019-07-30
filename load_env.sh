#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

PHP_M_VER=$1

USER=$(who | sed -n "1,1p" |awk '{print $1}')

# echo `who`
echo 'PHP_M_VER:'$PHP_M_VER
echo 'load:'$USER

# echo /Users/$USER/.bash_profile

echo "export PHP_VER=\"$PHP_M_VER\" #mdserver-mac loadenv" >> /Users/$USER/.bash_profile
echo "alias php=\"/Applications/mdserver/bin/php/php\$PHP_VER/bin/php\" #mdserver-mac loadenv" >> /Users/$USER/.bash_profile
echo "alias phpize=\"/Applications/mdserver/bin/php/php\$PHP_VAR/bin/phpize\" #mdserver-mac loadenv" >> /Users/$USER/.bash_profile
echo "alias pecl=\"/Applications/mdserver/bin/php/php\$PHP_VAR/bin/pecl\" #mdserver-mac loadenv" >> /Users/$USER/.bash_profile

source /Users/$USER/.bash_profile
