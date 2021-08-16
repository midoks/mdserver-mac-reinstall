#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=ioncube

echo "load $LIBNAME start"


NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/${NON_ZTS_FILENAME}/${LIBNAME}.so
if [ ! -f $extFile ]; then
	echo "load $LIBNAME fail"
	exit 1
fi



C='[ioncube]\
zend_extension=ioncube.so\
'

sed -i '_bak' "1s/^/${C}/g" $DIR/php/php$VERSION/etc/php.ini



$MDIR/bin/reinstall/reload.sh $VERSION

echo "load $LIBNAME end"