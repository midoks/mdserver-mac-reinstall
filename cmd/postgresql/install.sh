#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

if [ ! -d /usr/local/Cellar/postgresql ];then
	brew install postgresql
fi

if [ ! -d "$(brew --prefix)/var/postgres" ];then
	initdb --locale=C -E UTF-8 $(brew --prefix)/var/postgres
fi

