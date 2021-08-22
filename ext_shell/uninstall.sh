#! /bin/sh
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=$2

NON_ZTS_FILENAME=no-debug-non-zts-20121212
# if [ "$VERSION" == "56" ]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20131226
# elif [[ "$VERSION" == "70" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20151012
# elif [[ "$VERSION" == "71" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20160303
# elif [[ "$VERSION" == "72" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20170718
# elif [[ "$VERSION" == "73" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20180731
# elif [[ "$VERSION" == "74" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20190902
# elif [[ "$VERSION" == "80" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20200930
# elif [[ "$VERSION" == "81" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20201009
# else
# 	NON_ZTS_FILENAME=no-debug-non-zts-20121212
# fi

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$MDIR/bin/php/php$VERSION/lib/php/extensions/${NON_ZTS_FILENAME}/${LIBNAME}.so
echo $extFile
if [ -f $extFile ]; then
	rm -rf $extFile
	echo "uninstall $LIBNAME ok"
	exit 1
fi