#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# 简单的HTTP压测工具

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

echo '' > $MDIR/bin/logs/reinstall/cmd_other_dir_postgresql_install.log

echo 'install postgresql start'

if [ ! -d /usr/local/Cellar/postgresql ];then
	brew install postgresql
fi

echo 'install postgresql end'