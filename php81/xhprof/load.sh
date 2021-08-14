#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=xhprof

sh $MDIR/bin/reinstall/ext_shell/load.sh $VERSION $LIBNAME
echo "${LIBNAME}.output_dir=/Applications/mdserver/bin/tmp/xhprof" >> $DIR/php/php$VERSION/etc/php.ini
$MDIR/bin/reinstall/reload.sh $VERSION

