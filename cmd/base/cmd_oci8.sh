#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'oci8 lib start'

mkdir -p $MDIR/source/oci8

if [ ! -d /usr/local/Cellar/instantclient ];then

	mkdir -p /usr/local/Cellar/instantclient

	if [ ! -f $MDIR/source/oci8/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip ]; then
		wget -O $MDIR/source/oci8/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip
	fi


	unzip $MDIR/source/oci8/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip -d /usr/local/Cellar/instantclient


	if [ ! -f $MDIR/source/oci8/instantclient-sdk-macos.x64-19.8.0.0.0dbru.zip ]; then
		wget -O $MDIR/source/oci8/instantclient-sdk-macos.x64-19.8.0.0.0dbru.zip https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-sdk-macos.x64-19.8.0.0.0dbru.zip
	fi

	unzip $MDIR/source/oci8/instantclient-sdk-macos.x64-19.8.0.0.0dbru.zip -d /usr/local/Cellar/instantclient
fi

echo 'oci8 lib end'

