#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

sh $MDIR/bin/reinstall/unload_env.sh

PHP_M_VER=$1

USER=$(who | sed -n "1,1p" |awk '{print $1}')

# echo `who`
echo 'PHP_M_VER:'$PHP_M_VER
echo 'load:'$USER

# echo /Users/$USER/.zshrc

echo "export PHP_VER=\"$PHP_M_VER\" #mdserver-mac loadenv" >> /Users/$USER/.zshrc
echo "alias php=\"/Applications/mdserver/bin/php/php\$PHP_VER/bin/php\" #mdserver-mac loadenv" >> /Users/$USER/.zshrc
echo "alias phpize=\"/Applications/mdserver/bin/php/php\$PHP_VER/bin/phpize\" #mdserver-mac loadenv" >> /Users/$USER/.zshrc
echo "alias pecl=\"/Applications/mdserver/bin/php/php\$PHP_VER/bin/pecl\" #mdserver-mac loadenv" >> /Users/$USER/.zshrc

source /Users/$USER/.zshrc

# rm -rf /usr/local/opt/php
# ln -s  /Applications/mdserver/bin/php/php71 /usr/local/opt/php
