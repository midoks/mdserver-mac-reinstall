#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# 

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


mkdir -p $MDIR/source/re2c

echo 'install re2c start'


if [ ! -d $MDIR/source/re2c/re2c ]; then
	git clone https://github.com/skvadrik/re2c
fi

cd $MDIR/source/re2c/re2c
autoreconf -i -W all
./configure && make && make install

echo "url:"
echo "https://github.com/skvadrik/re2c\r\n"
echo "exp:"
echo 'install re2c end'